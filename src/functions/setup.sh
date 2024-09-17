#!/bin/bash

setup_git() {
    install_git $1 &&
    config_git
}

setup_kubernetes_toolkit() {
    install_kubernetes_toolkit $1 && 
    config_kubeconfig
    
}

setup_k3s() {
    install_k3s $1 && 
    config_kubeconfig
    
}

setup_vals() {
    install_vals $1 &&
    config_vals_vault
}


