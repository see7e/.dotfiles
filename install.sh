#!/usr/bin/env bash

# fetch the user name
USER=$(whoami)
INSTALLER_PATH="$(realpath "${BASH_SOURCE[0]}")"
RESOURCE_PATH="$(dirname "$INSTALLER_PATH")/resources"

function ask() {
    read -p "$1 (Y/n): " resp
    if [ -z "$resp" ]; then
        response_lc="y" # empty is Yes
    else
        response_lc=$(echo "$resp" | tr '[:upper:]' '[:lower:]') # case insensitive
    fi

    [ "$response_lc" = "y" ]
}

# greetings
@echo "Hello, $USER! this script will configure your XFCE DE, alongside with the dotfiles configurations."

@echo "Checking for required packages..."
@sudo apt update && @sudo apt upgrade -y
@sudo apt install git curl rsync -y

if ask "Install xfce theme packages? (Y/n)"; then
    source "$INSTALLER_PATH/xfce4theme.sh" "$RESOURCE_PATH/theme"
    exit_code=$?  # Capture the exit code of the sourced script
    if [ $exit_code -ne 0 ]; then
        echo "xfce4theme.sh script exited with non-zero status code: $exit_code"
        # Handle the error or exit gracefully
        exit $exit_code  # Optionally exit the main script with the same exit code
    fi
fi


if ask "'Install' the dotfiles? (Y/n)"; then
    source "$INSTALLER_PATH/dotfiles.sh" $RESOURCE_PATH
    exit_code=$?  # Capture the exit code of the sourced script
    if [ $exit_code -ne 0 ]; then
        echo "We had some problem with the dotfiles.sh script: $exit_code"
        # Handle the error or exit gracefully
        exit $exit_code  # Optionally exit the main script with the same exit code
    fi
fi

@echo "----------------------------------------------------------------------"
@echo "All done! Note that some changes may require a reload of the session"
@echo "to persist. The script will try to automatically do that for you!"
@echo "If it doesn't, please do it manually. Enjoy your new setup! :)"
@echo "----------------------------------------------------------------------"
pkill -u $USER