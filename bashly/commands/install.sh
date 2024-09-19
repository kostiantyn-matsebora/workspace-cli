WORKSPACE_APP="$(workspace_app)"
WORKSPACE_YES="$(workspace_yes)"

case "$WORKSPACE_APP" in
  "git")
    install_git_toolkit "$WORKSPACE_YES"
    ;;
  "docker")
    install_rootless_docker "$WORKSPACE_YES"
    ;;
  "k3s")
    install_k3s "$WORKSPACE_YES"
    ;;
  "minikube")
     install_minikube "$WORKSPACE_YES"
     ;;
  "kube-tools")
     install_kubernetes_toolkit "$WORKSPACE_YES"
     ;;
  "vals")
     install_vals "$WORKSPACE_YES"
     ;; 
  "vscode")
     install_vscode "$WORKSPACE_YES"
     ;;
  "all")
     install_git_toolkit "$WORKSPACE_YES" &&
     install_vscode "$WORKSPACE_YES" &
     install_rootless_docker "$WORKSPACE_YES" &&
     install_k3s "$WORKSPACE_YES" &&
     install_kubernetes_toolkit "$WORKSPACE_YES" &&
     install_vals "$WORKSPACE_YES"
esac
