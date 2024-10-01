#!/bin/bash
WORKSPACE_YES="$(workspace_yes)"
WORKSPACE_DISTRO="$(workspace_distro)"

case "$WORKSPACE_DISTRO" in
  "k3s")
    install_k3s "$WORKSPACE_YES"
    ;;
  "minikube")
     install_minikube "$WORKSPACE_YES"
     ;;
esac
