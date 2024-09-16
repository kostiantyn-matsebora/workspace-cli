#!/bin/bash
inspect_args
WORKSPACE_DIR="$(workspace_dir)"

WORKSPACE_APP="$(workspace_app)"
WORKSPACE_YES="$(workspace_yes)"
WORKSPACE_AUTOMATIC="$(workspace_automatic)"



case "$WORKSPACE_APP" in
  "git")
    setup_git
    ;;
  "docker")
    install_docker
    ;;
  "k3s")
    setup_k3s
    ;;
  "minikube")
     install_minikube
     ;;
  "kube-tools")
     setup_kubernetes_toolkit
     ;;
  "vals")
     setup_vals
     ;; 
  "vscode")
     install_vscode
     ;;
  "all")
     setup_git &&
     install_vscode &&
     install_docker &&
     setup_k3s &&
     setup_kubernetes_toolkit &&
     setup_vals
esac
