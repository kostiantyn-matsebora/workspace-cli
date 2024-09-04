#! /bin/bash

# Include functions
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source "$DIR/functions.sh"

YESTOALL=$(yes_to_all "$1")

yes_or_no "Do you want to install git?" $YESTOALL
if [[ $? -eq 0 ]]
then
	echo_info "Installing git"
	sudo apt install git -y
else
	echo_message "Skipping git installation"
fi

yes_or_no "Do you want to install VSCode?" $YESTOALL
if [[ $? -eq 0 ]]
then
	echo_info "Installing VSCode"
	sudo apt-get install  -y wget gpg
	wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
	sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
	echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
	rm -f packages.microsoft.gpg

	sudo apt install  -y apt-transport-https
	sudo apt  -y update
	sudo apt install -y code
else
	echo_message "Skipping VSCode installation"
fi

yes_or_no "Do you want to install shellcheck?" $YESTOALL
exit_if_answer_no

echo_info "Installing shellcheck"

sudo apt update &&
sudo apt install -y shellcheck

