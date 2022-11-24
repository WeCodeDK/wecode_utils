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

vscode_extensions=(
  Vue.volar
  ms-python.python
  neilding.language-liquid
  eamodio.gitlens
  zobo.php-intellisense
  xdebug.php-debug
  ryannaddy.laravel-artisan
  onecentlin.laravel-blade
  dbaeumer.vscode-eslint
  christian-kohler.path-intellisense
  bmewburn.vscode-intelephense-client
  esbenp.prettier-vscode
  dbankier.vscode-quick-select
  naumovs.color-highlight
  vscjava.vscode-gradle
)

green='\033[0;32m'
default='\033[0m'

print_welcome() {
  echo "
  ██╗    ██╗███████╗ ██████╗ ██████╗ ██████╗ ███████╗
  ██║    ██║██╔════╝██╔════╝██╔═══██╗██╔══██╗██╔════╝
  ██║ █╗ ██║█████╗  ██║     ██║   ██║██║  ██║█████╗  
  ██║ █╗ ██║█████╗  ██║     ██║   ██║██║  ██║█████╗  
  ██║ █╗ ██║█████╗  ██║     ██║   ██║██║  ██║█████╗  
  ██║███╗██║██╔══╝  ██║     ██║   ██║██║  ██║██╔══╝  
  ██║███╗██║██╔══╝  ██║     ██║   ██║██║  ██║██╔══╝  
  ██║███╗██║██╔══╝  ██║     ██║   ██║██║  ██║██╔══╝  
    ╚███╔███╔╝███████╗╚██████╗╚██████╔╝██████╔╝███████╗
    ╚══╝╚══╝ ╚══════╝ ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝                    
      ╚══╝╚══╝ ╚══════╝ ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝                    
        ╚══╝╚══╝ ╚══════╝ ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝                    
  "
}

print_options_list() {
  echo "1. Applications"
  echo "2. Commands"
  echo "3. Both"
}

print_application_list() {
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
}

print_extension_list() {
  echo ""
  echo "The following extensions will be installed:"
  echo "  1. Vue Volar - Vue 3 Support"
  echo "  2. Python - Python Support"
  echo "  3. Liquid - Liquid Support"
  echo "  4. GitLens - Git Support"
  echo "  5. PHP Intellisense - PHP Support"
  echo "  6. PHP Debug - PHP Debugging"
  echo "  7. Laravel Artisan - Laravel Support"
  echo "  8. Laravel Blade - Laravel Blade Support"
  echo "  9. ESLint - JavaScript Linting"
  echo "  10. Path Intellisense - Path Autocomplete"
  echo "  11. Intelephense - PHP Support"
  echo "  12. Prettier - Code Formatting"
  echo "  13. Quick Select - Quick File Selection"
  echo "  14. Color Highlight - Color Highlighting"
  echo "  15. Gradle - Gradle Support"
  echo ""
}

install_vscode_extensions() {
  echo "Installing Visual Studio Code Extensions.."
  for extension in "${vscode_extensions[@]}"; do
    code --install-extension $extension
  done
}

prompt_continue() {
  prompt="Do you want to continue? (y/n)"
  while true; do
    read -p "$prompt" yn
    case $yn in
    [Yy]*) break ;;
    [Nn]*) exit ;;
    *) echo "Please answer yes or no." ;;
    esac
  done
}

print_green() {
  echo -e "${green}$1..${default}"
  echo ""
}

install_commands() {
  /bin/bash -c "$(curl -fsSL -H 'Cache-Control: no-cache, no-store' https://raw.githubusercontent.com/WeCodeDK/wecode_utils/main/install_commands.sh)"
  echo ".. Close this window and open a new terminal window to start using the new commands"
}

install_applications() {
  echo "Installing Homebrew"
  # check if homebrew is installed
  if test ! $(which brew); then
    # install homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # add to path
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>/Users/$USER/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"

  else
    print_green "Homebrew is already installed"
  fi

  echo "Installing Command Line Tools"
  # check if xcode-select is installed
  if xcode-select -p &>/dev/null; then
    print_green "Command Line Tools already installed"

  else
    xcode-select --install
  fi

  echo "Installing Visual Studio Code"
  # check if visual studio code is installed and echo if it is
  if test ! $(which code); then
    # install visual studio code
    brew install --cask visual-studio-code

    # add visual studio code to path
    echo 'export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"' >>~/.zshrc

    # ask the user if they want to install the extensions
    print_extension_list
    prompt="Do you want to install the extensions for VSCode? (y/n)"
    while true; do
      read -p "$prompt" yn
      case $yn in
      [Yy]*)
        install_vscode_extensions
        break
        ;;
      [Nn]*) break ;;
      *) echo "Please answer yes or no." ;;
      esac
    done

  else
    print_green "Visual Studio Code is already installed"
  fi

  echo "Installing Composer"
  # check if composer is installed and echo if it is
  if test ! $(which composer); then
    # install composer
    brew install composer
  else
    print_green "Composer already installed"
  fi

  echo "Installing NodeJS"
  # check if nodejs is installed and echo if it is
  if test ! $(which node); then
    # install nodejs
    brew install node
  else
    print_green "NodeJS already installed"
  fi

  echo "Installing NPM"
  # check if npm is installed and echo if it is
  if test ! $(which npm); then
    # install npm
    brew install npm
  else
    print_green "NPM already installed"
  fi

  echo "Installing Sequel Ace"
  # check if sequel ace is installed and echo if it is
  # test if it is already in /Applications/Sequel Ace.app
  if test ! -d "/Applications/Sequel Ace.app"; then
    # install sequel ace
    brew install --cask sequel-ace
  else
    print_green "Sequel Ace already installed"
  fi

  echo "Installing Slack"
  # check if slack is installed and echo if it is
  if test ! -d "/Applications/Slack.app"; then
    # install slack
    brew install --cask slack
  else
    print_green "Slack already installed"
  fi

  echo "Installing Google Chrome"
  # check if google chrome is installed and echo if it is
  if test ! -d "/Applications/Slack.app"; then
    # install google chrome
    brew install --cask google-chrome
  else
    print_green "Google Chrome already installed"
  fi

  echo "Installing Postman"
  # check if postman is installed and echo if it is
  if test ! -d "/Applications/Postman.app"; then
    # install postman
    brew install --cask postman
  else
    print_green "Postman already installed"
  fi

  echo "Installing ClickUp"
  # check if clickup is installed and echo if it is
  if test ! -d "/Applications/ClickUp.app"; then
    # install clickup
    brew install --cask clickup
  else
    print_green "ClickUp already installed"
  fi

  echo "Installing Harvest"
  if test ! -d "/Applications/Harvest.app"; then
    echo "Please install Harvest from App Store"

    # Ask the user to press enter to continue
    prompt="Press enter to open App Store"
    while true; do
      read -p "$prompt" yn
      case $yn in
      *) break ;;
      esac
    done

    open "macappstores://itunes.apple.com/app/id506189836"
  else
    print_green "Harvest already installed"
  fi
}

continue_with_applications() {
  echo ""
  print_application_list
  prompt_continue
  install_applications
}

prompt_options() {
  print_options_list
  echo ""
  read -p "Choose what to install: " option

  # install the selected option
  case $option in
  1) continue_with_applications ;;
  2) install_commands ;;
  3)
    continue_with_applications
    install_commands
    ;;
  *)
    echo "Please choose a valid option"
    exit
    ;;
  esac
}

## Main ##

clear
print_welcome
prompt_options

echo ""
echo -e "${green}Done!${default} now you can start programming 🚀 😎"

echo ""
