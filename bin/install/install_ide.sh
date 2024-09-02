#! /bin/bash

# Include functions
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source "$DIR/functions.sh"

yes_or_no "Do you want to install shell utilities"
exit_if_answer_no

echo_message "Installing shell utilities"

sudo apt update &&
sudo apt install -y shellcheck

