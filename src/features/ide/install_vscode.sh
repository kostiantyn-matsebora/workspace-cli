#!/bin/bash

## Supported modes:
##  - interactive
##  - automatic
## Description:
##  - Install and configure VS Code
install_vscode() {
    AUTOMATIC_MODE=$(is_automatic_mode "$1")

    echo_info "Installing and configuring VSCode"

    yes_or_no "Do you want to install VSCode?" "$AUTOMATIC_MODE"
    if [[ $? -eq 0 ]]
    then
        echo_message "Installing VSCode"
        sudo apt-get install  -y wget gpg
        wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
        sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
        echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
        rm -f packages.microsoft.gpg

        sudo apt install  -y apt-transport-https
        sudo apt  -y update
        sudo apt install -y code
    else
        echo_message "Skipping VSCode installation"
    fi
    exit_if_error "Error installing VSCode"
    
    yes_or_no "Do you want to install shellcheck?" "$AUTOMATIC_MODE"

    if [[ $? -eq 0 ]] 
    then
        echo_message "Installing shellcheck"
        sudo apt update &&
        sudo apt install -y shellcheck
    else
        echo_message "Skipping shellcheck installation"
    fi
}

