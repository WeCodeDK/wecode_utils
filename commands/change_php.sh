#!/bin/bash -i

echo -e "\n\033[0;33mInfo: \033[0;37mUnlinking current php.."
brew unlink php 2>&1 >/dev/null

echo -e "\033[0;33mInfo: \033[0;37mChecking for already present php.."
brew list php@$1 >/dev/null || brew install php@$1 >/dev/null

echo -e "\033[0;33mInfo: \033[0;37mLinking php.."
brew link php@$1 >/dev/null

if [ $? -ne 0 ]; then
    echo -e "\n\033[0;31mError: \033[0;37mPHP could not be changed to: PHP@$1\n"
    exit
fi

echo -e "\n\033[0;37mPHP changed to: \033[0;32mPHP@$1\n" ;

echo -e '\033[0;32m-----------------'
php -v | grep cli
echo -e '-----------------\n'


