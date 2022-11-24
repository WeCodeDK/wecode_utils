#!/bin/bash -i

echo -e "\n\033[0;33mInfo: \033[0;37mInstalling cphp.."

# create /usr/local/bin if it doesn't exist
if [ ! -d "/usr/local/bin" ]; then
    sudo mkdir /usr/local/bin
fi

sudo curl -s https://raw.githubusercontent.com/WeCodeDK/wecode_utils/main/commands/change_php.sh > change_php.sh
sudo mv change_php.sh /usr/local/bin/cphp
sudo chmod +x /usr/local/bin/cphp
# if the last two commands fail, the script will exit
if [ $? -ne 0 ]; then
    echo -e "\n\033[0;31mError: \033[0;37mCould not install cphp\n"
    exit
fi

# tell the user that cphp is installed with a green success
echo -e "\033[0;32mSucces: \033[0;37mcphp installed successfully\n" ;

# usage: cphp 7.2
# Tell the user how to use the script
echo -e "\033[0;33mInfo: \033[0;37mUsage: cphp 8.1\n"