#!/bin/bash

## Install rootless docker and docker-compose
## https://rootlesscontaine.rs/getting-started/docker/

# Include functions
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source "$DIR/functions.sh"

YESTOALL=$(yes_to_all "$1")

echo_info "Installing and configuring rootless docker and docler-compose"


yes_or_no "Do you want to install rootless docker (roothless docker + containerd + buildkit)?" "$YESTOALL"

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

    # Installing docker-compose
    echo_message "Installing docker-compose"
    sudo apt install docker-compose -y
fi
