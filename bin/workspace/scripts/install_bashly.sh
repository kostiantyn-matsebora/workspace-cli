#!/bin/bash

## Supported modes:
##  - automatic
##  - interactive
## Requirements:
##  - Docker must be installed
## Description:
##  - Configure shell to run bashly commands

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source "$DIR/_functions.sh"

echo_info "Configure shell to run bashly commands as a Docker container"

## Configure shell to run bashly commands as a Docker container
echo "alias bashly='docker run --rm -it --volume "$PWD:/app" dannyben/bashly'" >> ~/.bashrc
source ~/.bashrc

