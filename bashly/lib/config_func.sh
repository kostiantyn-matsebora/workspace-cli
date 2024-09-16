#! /bin/bash

config_git() {
    . "$WORKSPACE_DIR/scripts/configure_git.sh"
}

config_kubeconfig() {
    . "$WORKSPACE_DIR/scripts/configure_kubeconfig.sh" $1
}

config_vals_vault() {
    . "$WORKSPACE_DIR/scripts/configure_vals_vault.sh"
}

