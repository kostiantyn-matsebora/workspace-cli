#!/bin/bash

## Install and configure kubernetes tools
# Include functions
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source "$DIR/functions.sh"

YESTOALL=$(yes_to_all "$1")

echo_info "Installing  and configuring kubernetes tools."

INSTALL_KUBECTL=0
if [ -e /usr/local/bin/kubectl ]
then
 echo_message "Kubectl is already installed."
 yes_or_no "Do you want to reinstall/upgrade it?" "$YESTOALL"
 INSTALL_KUBECTL=$?
fi

if [[ "$INSTALL_KUBECTL" = "0" ]]
 then
    echo_message "Installing kubectl"
    sudo apt install kubectl -y
fi

exit_if_error "Error installing kubectl"

echo 
