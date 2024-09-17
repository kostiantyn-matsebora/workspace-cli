#!/bin/bash
WORKSPACE_APP="$(workspace_app)"


case "$WORKSPACE_APP" in
  "git")
    # Configure git
    configure_git
    ;;
  "kubeconfig")
    # Configure kubernetes config file
    configure_kubeconfig
    ;;
  "vals")
    # Configure vals for using Hashicorp Vault as secrets store
    configure_vals
    ;;
  "grub-menu")
    # Configure grub menu
    configure_grub_menu
    ;;
  "all")
    configure_git
    configure_kubeconfig
    configure_vals
    ;;
esac
