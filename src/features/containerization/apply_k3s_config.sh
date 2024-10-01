#!/bin/bash

## Supported modes:
##  - interactive
## Description:
##  - Rewrite kubeconfig file by k3s client configuration
apply_k3s_config() {
    echo_info "Configure kubectl to use k3s"

    if [ -e /etc/rancher/k3s/k3s.yaml ]
    then
        yes_or_no "Do you want to configure kubectl to use k3s?" "$AUTOMATIC_MODE"
        if [[ $? -eq 0 ]]
        then
            echo_message "Configuring kubectl to use k3s"
            mkdir -p ~/.kube
            exit_if_error "Error configuring kubectl to use k3s"
            if [ -e ~/.kube/config ]
            then
                echo_message "Backing up existing kubectl configuration"
                mv ~/.kube/config ~/.kube/config.bak
                exit_if_error "Error configuring kubectl to use k3s"
            fi

            echo_message "Copying k3s configuration  as kubectl configuration"
            cp /etc/rancher/k3s/k3s.yaml ~/.kube/config &&
            chmod go-r ~/.kube/config &&
            kubectl config set-context default &&
            kubectl config use-context default
            exit_if_error "Error configuring kubectl to use k3s"
        else
            echo_message "Skipping k3s configuration"
        fi
    fi
}
