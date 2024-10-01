#!/bin/bash

## Supported modes:
##  - interactive
## Description:
##  - Beautify Grub menu

configure_grub_menu() {
    echo_info "Beautify Grub menu"

    yes_or_no "Do you want to beautify Grub menu?"
    
      if [[ $? -eq 0 ]]
    then
        echo_message "Beautify Grub menu for Linux Mint"
        sudo apt install --reinstall -o Dpkg::Options::="--force-confmiss" grub2-theme-mint2k
    fi
}
