#!/bin/bash

## Supported modes:
##  - interactive
## Description:
##  - Read Hashicorp Vault Address and token from user and add them as environment variables to .bashrc
configure_vals_vault() {
    echo_info "Configure vals for using Hashicorp Vault as secrets store"

    yes_or_no "Do you want to vals for using Hashicorp Vault as secrets store?"

    if [[ $? -eq 0 ]]
    then
        # Prompt the user for Vault URL and token
        VAULT_ADDR=$(read_input "Enter Hashicorp Vault URL: ")
        VAULT_TOKEN=$(read_input "Enter Vault Token: ")

        # Add the environment variables to .bashrc
        echo "export VAULT_ADDR=$VAULT_ADDR" >> ~/.bashrc
        echo "export VAULT_TOKEN=$VAULT_TOKEN" >> ~/.bashrc
        echo "export VAULT_AUTH_METHOD=token" >> ~/.bashrc

        # Inform the user
        echo "Vault URL and token have been added to ~/.bashrc"

        # Source the .bashrc to apply changes immediately
        source ~/.bashrc
    fi
}
