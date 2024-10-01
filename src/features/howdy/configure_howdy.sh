#!/bin/bash

## Supported modes:
##  - interactive
## Description:
##  - Changing device path for howdy
##  - Add face recognition for howdy

function configure_howdy() {
    echo_info "Configure howdy"

    yes_or_no "Do you want to change device path for howdy?"
    if [ $? -eq 0 ]
    then
        DEVICE_PATH=$(read_input "Enter your device path: ")
        sudo sed -i "s|DevicePath = /dev/video0|DevicePath = $DEVICE_PATH|g" /lib/systemd/system/howdy.service
        exit_if_error "Error changing device path"
    fi

    yes_or_no "Do you want to add face recognition for howdy?"

    while [ $? -eq 0 ]
    do
        sudo howdy add
        exit_if_error "Error adding face recognition"
        yes_or_no "Do you want to add face recognition for howdy?"

    done
    echo_info "If you added face recognition, please restart your computer" 
}
