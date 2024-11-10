#!/bin/bash

## Supported modes:
##  - interactive
##  - automatic
## Description:
##  - Install docker-compose
install_docker_compose() {

    AUTOMATIC_MODE=$(is_automatic_mode "$1")

    echo_info "Installing docker-compose"

    yes_or_no "Do you want to install docker_compose?" "$AUTOMATIC_MODE"

    if [ $? -eq 0 ] 
    then
        # Installing docker-compose
        echo_message "Installing docker-compose"
        sudo apt install docker-compose -y
    fi
}
