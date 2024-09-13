#!/bin/bash

## Supported modes:
##  - interactive
##  - automatic
## Description:
##  - Install vals (https://github.com/helmfile/vals) used by helmfile to retrieve secrets

# Include functions
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source "${DIR}/_functions.sh"

echo_info "Install vals (https://github.com/helmfile/vals)"

INSTALL_VALS=0

if [ -e /usr/local/bin/vals ]
then
 echo_message "Vals is already installed."
 yes_or_no "Do you want to reinstall/upgrade it?" "$AUTOMATIC_MODE"
 INSTALL_VALS=$?
else 
 yes_or_no "Do you want to install vals?" "$AUTOMATIC_MODE"
 INSTALL_VALS=$?
fi

if [[ "$INSTALL_VALS" = "0" ]]
 then
    echo_message "Installing vals"
    VALS_URL="https://github.com/helmfile/vals/releases/download/v0.37.5/vals_0.37.5_linux_amd64.tar.gz"
    DEST_DIR="/usr/local/bin"
    curl -L $VALS_URL -o vals.tar.gz &&
    sudo tar -xzf vals.tar.gz -C $DEST_DIR &&
    rm vals.tar.gz
    exit_if_error "Error installing vals"
fi
