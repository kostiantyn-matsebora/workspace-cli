#!/bin/bash

## Supported modes:
##  - interactive
## Description:
##  - Set global username and email for git
##  - Generate ssh keys for git and add them to ssh config
configure_git() {
    echo_info "Configure git"

    yes_or_no "Do you want to set global username and email for git?"
    if [ $? -eq 0 ]
    then
        USERNAME=$(read_input "Enter your username: ")
        git config --global user.name "$USERNAME"
        exit_if_error "Error setting global username"

        EMAIL=$(read_input "Enter your email: ")
        git config --global user.email "$EMAIL"
        exit_if_error "Error setting global email"
    fi
}
