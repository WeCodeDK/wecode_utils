#!/bin/bash

# This script will install all programs for the developer
# The script is to be used on Mac OS X

# Programs to be installed
# 1. Homebrew
# 2. Command Line Tools
# 4. visual studio code
# 5. composer
# 6. nodejs
# 7. npm
# 8. sequel ace
# 9. slack
# 10. google chrome
# 11. postman
# 12. harvest
# 13. clickup

# clear the screen
clear

echo "
██╗    ██╗███████╗ ██████╗ ██████╗ ██████╗ ███████╗
██║    ██║██╔════╝██╔════╝██╔═══██╗██╔══██╗██╔════╝
██║ █╗ ██║█████╗  ██║     ██║   ██║██║  ██║█████╗  
██║███╗██║██╔══╝  ██║     ██║   ██║██║  ██║██╔══╝  
╚███╔███╔╝███████╗╚██████╗╚██████╔╝██████╔╝███████╗
 ╚══╝╚══╝ ╚══════╝ ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝                    
"

# Tell the user what programs will be installed
echo "The following programs will be installed:"
echo "  1. Homebrew - Package Manager"
echo "  2. Command Line Tools - Command Line Tools"
echo "  3. Visual Studio Code - Code Editor"
echo "  4. Composer - PHP Package Manager"
echo "  5. NodeJS - JavaScript Runtime"
echo "  6. NPM - Node Package Manager"
echo "  7. Sequel Ace - MySQL Client"
echo "  8. Slack - Team Communication"
echo "  9. Google Chrome - Web Browser"
echo "  10. Postman - API Testing"
echo "  11. Harvest - Time Tracking"
echo "  12. ClickUp - Task Management"
echo ""

# Ask the user if they want to continue
prompt="Do you want to continue? (y/n)"
while true; do
    read -p "$prompt" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo ""

echo "Installing Homebrew"
# check if homebrew is installed
if test ! $(which brew); then
  # install homebrew
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

echo "Installing Command Line Tools"
# check if xcode-select is installed
if xcode-select -p &> /dev/null; then
    echo "Command Line Tools already installed"
else
    xcode-select --install
fi

echo "Installing Visual Studio Code"
# check if visual studio code is installed and echo if it is
if test ! $(which code); then
  # install visual studio code
  brew install --cask visual-studio-code
else
  echo "Visual Studio Code already installed"
fi


echo "Installing Composer"
# check if composer is installed and echo if it is
if test ! $(which composer); then
  # install composer
  brew install composer
else
  echo "Composer already installed"
fi

echo "Installing NodeJS"
# check if nodejs is installed and echo if it is
if test ! $(which node); then
  # install nodejs
  brew install node
else
  echo "NodeJS already installed"
fi

echo "Installing NPM"
# check if npm is installed and echo if it is
if test ! $(which npm); then
  # install npm
  brew install npm
else
  echo "NPM already installed"
fi

echo "Installing Sequel Ace"
# check if sequel ace is installed and echo if it is
# test if it is already in /Applications/Sequel Ace.app
if test ! -d "/Applications/Sequel Ace.app"; then
  # install sequel ace
  brew install --cask sequel-ace
else
  echo "Sequel Ace already installed"
fi


echo "Installing Slack"
# check if slack is installed and echo if it is
if test ! -d "/Applications/Slack.app"; then
  # install slack
  brew install --cask slack
else
  echo "Slack already installed"
fi

echo "Installing Google Chrome"
# check if google chrome is installed and echo if it is
if test ! -d "/Applications/Slack.app"; then
  # install google chrome
  brew install --cask google-chrome
else
  echo "Google Chrome already installed"
fi

echo "Installing Postman"
# check if postman is installed and echo if it is
if test ! -d "/Applications/Postman.app"; then
  # install postman
  brew install --cask postman
else
  echo "Postman already installed"
fi

echo "Installing ClickUp"
# check if clickup is installed and echo if it is
if test ! -d "/Applications/ClickUp.app"; then
  # install clickup
  brew install --cask clickup
else
  echo "ClickUp already installed"
fi

echo ""
echo "Please install Harvest from App Store"
open "macappstores://itunes.apple.com/app/id506189836"

# sleep for 2 seconds
sleep 1

echo ""
echo "- All done! Now you can start coding 😎"
