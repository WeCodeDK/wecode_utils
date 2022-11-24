#!/bin/bash

help="Usage: iphp [version]

Example: iphp 8.1 artisan migrate

Description:
This script will run the php command with the specified version
If no version is specified, the default php version will be used
If a version is specified and it is not installed, it will be installed

Available versions:
"

if [ "$1" == "-h" ]; then
    echo "$help 
$(brew search php | grep php@ | sed 's/php@//g')"
    exit
fi

# if the first argument is not a version, then we assume that the user wants to run the default php version
if [[ "$1" != "7."* ]] && [[ "$1" != "8."* ]]; then
    php $1 $2 $3 $4 $5 $6 $7 $8 $9
    exit
fi

if ls /opt/homebrew/Cellar/php/$1* 1> /dev/null 2>&1; then
    php $2 $3 $4 $5 $6 $7 $8 $9
    exit
fi

#/opt/homebrew/Cellar/php@8.0/8.0.25/bin/php artisan migrate
dir="/opt/homebrew/Cellar/php@$1"
if [ -d "$dir" ]; then
    # get the latest version of the php version
    version=$(ls -t $dir | head -1)
    # get the path to the php binary
    path="$dir/$version/bin/php"

    # run the php command with the specified version
    $path $2 $3 $4 $5 $6 $7 $8 $9
else
    echo -e "\n\033[0;31mError: \033[0;37mPHP@$1 is not installed\n"
    
    echo -e "\033[0;33mInfo: \033[0;37mInstalling PHP@$1.."
    brew install php@$1 

    echo -e "\033[0;33mInfo: \033[0;37mRunning the command again..\n"
    iphp $1 $2 $3 $4 $5 $6 $7 $8 $9
fi