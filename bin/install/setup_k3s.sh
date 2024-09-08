#! /bin/bash

## Install and configure k3s

# Include functions
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source "$DIR/functions.sh"

YESTOALL=$(yes_to_all "$1")

echo_info "Installing and configuring k3s" 

yes_or_no "Do you want to install k3s?" "$YESTOALL"

if [[ $? -eq 0 ]]
then
	if [-e /usr/local/bin/ufw ]
	then
		echo_message "Adding firewall rules for k3s"
		ufw allow 6443/tcp && #apiserver
		ufw allow from 10.42.0.0/16 to any && #pods
		ufw allow from 10.43.0.0/16 to any #services
		exit_if_error "Error adding firewall rules for k3s"
	fi

	echo_message "Installing k3s"
	curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="server" sh -s - --flannel-backend vxlan
	exit_if_error "Error installing k3s"
else
	echo_message "Skipping k3s installation"
fi
