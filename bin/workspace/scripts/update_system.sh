#! /bin/bash

## Supported modes:
##  - automatic
## Description:
##  - Update system and install packages

# Include functions
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source "$DIR/_functions.sh"

echo_message "Update packages to latest version"

apt update && apt upgrade -y
exit_if_error "Error occured during update of system"


