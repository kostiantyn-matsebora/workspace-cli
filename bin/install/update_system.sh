#! /bin/bash

## Update system and install packages

# Include functions
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source "$DIR/functions.sh"

echo_message "Update packages to latest version"

apt update && apt upgrade -y
exit_if_error "Error occured during update of system"

yes_or_no "Do you want to beautify Grub menu?"
exit_if_answer_no

echo_message "Beautify Grub menu for Linux Mint"
apt install --reinstall -o Dpkg::Options::="--force-confmiss" grub2-theme-mint2k
