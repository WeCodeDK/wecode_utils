#!/bin/bash -i

echo -e "\n\033[0;33mInfo: \033[0;37mInstalling cphp.."

# create /usr/local/bin if it doesn't exist
if [ ! -d "/usr/local/bin" ]; then
    sudo mkdir /usr/local/bin
fi


# if the command already exists, delete it
if [ -f "/usr/local/bin/cphp" ]; then
    sudo rm /usr/local/bin/cphp
fi

curl -s https://raw.githubusercontent.com/WeCodeDK/wecode_utils/main/commands/change_php.sh > change_php.sh
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


echo -e "\n\033[0;33mInfo: \033[0;37mInstalling iphp.."

# if the command already exists, delete it
if [ -f "/usr/local/bin/iphp" ]; then
    sudo rm /usr/local/bin/iphp
fi

curl -s https://raw.githubusercontent.com/WeCodeDK/wecode_utils/main/commands/inline_php.sh > inline_php.sh
sudo mv inline_php.sh /usr/local/bin/iphp
sudo chmod +x /usr/local/bin/iphp

# if the last two commands fail, the script will exit
if [ $? -ne 0 ]; then
    echo -e "\n\033[0;31mError: \033[0;37mCould not install iphp\n"
    exit
fi

# tell the user that iphp is installed with a green success
echo -e "\033[0;32mSucces: \033[0;37miphp installed successfully\n" ;

# usage: iphp "echo 'hello world'"
# Tell the user how to use the script
echo -e "\033[0;33mInfo: \033[0;37mUsage: iphp 8.3 artisan migrate\n"
