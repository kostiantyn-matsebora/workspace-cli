#!/bin/bash
install_git() {
    . "$WORKSPACE_DIR/scripts/install_git_toolkit.sh" "$WORKSPACE_AUTOMATIC"
}

install_docker() {
    . "$WORKSPACE_DIR/scripts/install_rootless_docker.sh" "$WORKSPACE_AUTOMATIC"
}

install_k3s() {
    . "$WORKSPACE_DIR/scripts/install_k3s.sh" "$WORKSPACE_AUTOMATIC"
}

install_minikube() {
    . "$WORKSPACE_DIR/scripts/install_minikube.sh" "$WORKSPACE_AUTOMATIC"
}

install_kubernetes_toolkit() {
    . "$WORKSPACE_DIR/scripts/install_kubernetes_toolkit.sh" "$WORKSPACE_AUTOMATIC"
}

install_vscode() {
    . "$WORKSPACE_DIR/scripts/install_vscode.sh" "$WORKSPACE_AUTOMATIC"
}

install_vals() {
    . "$WORKSPACE_DIR/scripts/install_vals.sh" "$WORKSPACE_AUTOMATIC"
}
