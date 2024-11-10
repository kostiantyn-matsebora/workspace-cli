#!/bin/bash
WORKSPACE_APP="$(workspace_app)"
WORKSPACE_YES="$(workspace_yes)"

case "$WORKSPACE_APP" in
  "git")
    setup_git_toolkit "$WORKSPACE_YES"
    ;;
  "docker")
    install_rootless_docker "$WORKSPACE_YES"
    install_docker_compose "$WORKSPACE_YES"
    ;;
  "k3s")
    setup_k3s
    ;;
  "minikube")
     install_minikube "$WORKSPACE_YES"
     ;;
  "kube-tools")
     setup_kubernetes_toolkit "$WORKSPACE_YES"
     ;;
  "vals")
     setup_vals "$WORKSPACE_YES"
     ;; 
  "vscode")
     install_vscode "$WORKSPACE_YES"
     ;;
  "all")
     setup_git_toolkit "$WORKSPACE_YES" &&
     install_vscode "$WORKSPACE_YES" &&
     install_rootless_docker "$WORKSPACE_YES" &&
     install_docker_compose "$WORKSPACE_YES" &&
     setup_k3s "$WORKSPACE_YES" &&
     setup_kubernetes_toolkit "$WORKSPACE_YES" &&
     setup_vals "$WORKSPACE_YES"
esac
