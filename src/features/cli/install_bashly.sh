#!/bin/bash

## Supported modes:
##  - automatic
## Requirements:
##  - Docker must be installed
## Description:
##  - Configure shell to run bashly commands
install_bashly() {
	echo_info "Configure shell to run bashly commands as a Docker container"

	## Configure shell to run bashly commands as a Docker container
	echo "alias bashly='docker run --rm -it --volume "$PWD:/app" dannyben/bashly'" >> ~/.bashrc
	source ~/.bashrc
}

