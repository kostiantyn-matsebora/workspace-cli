#!/bin/bash

## Supported modes:
##  - interactive

## Description:
##  - Show kubectl configuration
show_kube_config() {
if [ -e ~/.kube/config ]
then
	echo_message "Your kubectl configuration (~/.kube/config) is:"
	cat ~/.kube/config
	echo_message "For editing configuration, use command: kubectl edit config"
	exit_if_error "Error getting kubectl configuration"
else
	echo_message "Kubectl configuration (~/.kube/config) is not found."
fi
}
