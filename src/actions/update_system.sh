#! /bin/bash

## Supported modes:
##  - automatic
## Description:
##  - Update system and install packages
update_system() {
	echo_message "Update packages to latest version"

	apt update && apt upgrade -y
	exit_if_error "Error occured during update of system"

}


