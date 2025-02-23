#!/bin/bash

## Supported modes:
##  - interactive
##  - automatic
## Description:
##  - Setup docker https://rootlesscontaine.rs/getting-started/docker/
##  - Setup docker-compose
install_docker() {

    AUTOMATIC_MODE=$(is_automatic_mode "$1")

    echo_info "Installing and configuring docker"

    yes_or_no "Do you want to install docker ?" "$AUTOMATIC_MODE"

    if [ $? -eq 0 ] 
    then
        echo_message "Installing docker"
        # Add Docker's official GPG key:
        sudo apt-get update
        sudo apt-get install ca-certificates curl
        sudo install -m 0755 -d /etc/apt/keyrings
        sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
        sudo chmod a+r /etc/apt/keyrings/docker.asc

        # Add the repository to Apt sources:
        echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
        $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
        sudo apt-get update
        sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
        exit_if_error "Error setting up docker"
    fi
}
