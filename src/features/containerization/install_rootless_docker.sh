#!/bin/bash

## Supported modes:
##  - interactive
##  - automatic
## Description:
##  - Setup rootless docker https://rootlesscontaine.rs/getting-started/docker/
##  - Setup docker-compose
install_rootless_docker() {

    AUTOMATIC_MODE=$(is_automatic_mode "$1")

    echo_info "Installing and configuring rootless docker"

    yes_or_no "Do you want to install rootless docker (roothless docker + containerd + buildkit)?" "$AUTOMATIC_MODE"

    if [ $? -eq 0 ] 
    then
        # Install dependencies
    echo_message "Installing docker"
    curl -o install.sh -fsSL https://get.docker.com
    sudo sh install.sh
    exit_if_error "Error installing docker"

    # Setup rootless docker
    echo_message "Setting up rootless docker"
    dockerd-rootless-setuptool.sh install
    exit_if_error "Error setting up rootless docker"

    # Cleanup
    echo_message "Cleaning up"
    rm -f install.sh
    exit_if_error "Error cleaning up"
    fi
}
