#! /bin/bash

## Supported modes:
##  - automatic
## Description:
##  - Update system and install packages
upgrade_system() {
    echo_message "Update packages to latest version"
    yes_or_no "Do you really want to upgrade packages to latest version?"

    if [[ $? -eq 0 ]]
    then
        sudo apt update && sudo apt upgrade -y
        exit_if_error "Error occured during update of system"
    fi
}


