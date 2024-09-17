#!/bin/bash

## Supported modes:
##  - interactive
##  - automatic
## Description:
##  - Install git CLI
##  - Install github CLI

# Include functions
install_git_toolkit() {

    AUTOMATIC_MODE=$(is_automatic_mode "$1")

    echo_info "Installing git and github CLI"

    yes_or_no "Do you want to install git?" "$AUTOMATIC_MODE"

    if [[ $? -eq 0 ]]
    then
        echo_message "Installing git"
        sudo apt install git -y
    else
        echo_message "Skipping git installation"
    fi
    exit_if_error "Error installing git"
    
    yes_or_no "Do you want to install github CLI?" "$AUTOMATIC_MODE"

    if [[ $? -eq 0 ]]
    then
        echo_message "Installing github CLI"
        sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0 &&
        sudo apt-add-repository https://cli.github.com/packages -y &&
        sudo apt update && -y
        sudo apt install gh -y
    else
        echo_message "Skipping github CLI installation"
    fi

    if [ $AUTOMATIC_MODE -eq 0 ]
    then
        exit 0
    fi

}
