#!/bin/bash
WORKSPACE_DIR="$(workspace_dir)"
WORKSPACE_APP="$(workspace_app)"


case "$WORKSPACE_APP" in
  "git")
    # Configure git
    config_git
    ;;
  "kubeconfig")
    # Configure kubernetes config file
    config_kubeconfig
    ;;
  "vals")
    # Configure vals for using Hashicorp Vault as secrets store
    config_vals
    ;;
  "all")
    config_git
    config_kubeconfig
    config_vals
    ;;
esac
