#!/bin/bash

setup_git_toolkit() {
    install_git_toolkit $1 &&
    config_git
}

setup_kubernetes_toolkit() {
    install_kubernetes_toolkit $1 && 
    config_kubeconfig
    
}

setup_k3s() {
    install_k3s $1 && 
    apply_k3s_config
    
}

setup_vals() {
    install_vals $1 &&
    config_vals_vault
}


