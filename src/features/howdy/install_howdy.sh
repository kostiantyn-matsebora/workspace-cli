#!/bin/bash

## Supported modes:
##  - interactive
##  - automatic
## Description:
##  - Install howdy
##  - Install v4l-utils for howdy

install_howdy() {
    echo_info "Install howdy and v4l-utils"

    yes_or_no "Do you want to install howdy?" "$AUTOMATIC_MODE"
    if [[ $? -eq 0 ]]
    then
        sudo add-apt-repository ppa:boltgolt/howdy
        sudo apt update
        sudo apt install howdy -y
        echo_message "Installing howdy"
    else
        echo_message "Skipping howdy installation"
        return
    fi

    yes_or_no "Do you want to install v4l-utils?" "$AUTOMATIC_MODE"
    if [[ $? -eq 0 ]]
    then
        echo_message "Installing v4l-utils"
        sudo apt install v4l-utils -y
    else
        echo_message "Skipping v4l-utils installation"
    fi
}
