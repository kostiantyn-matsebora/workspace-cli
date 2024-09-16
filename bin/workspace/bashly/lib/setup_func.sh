#!/bin/bash

setup_git() {
    install_git &&
    config_git
}

setup_kubernetes_toolkit() {
    install_kubernetes_toolkit && 
    config_kubeconfig
    
}

setup_k3s() {
    install_k3s && 
    config_kubeconfig
    
}

setup_vals() {
    install_vals &&
    config_vals_vault
}


