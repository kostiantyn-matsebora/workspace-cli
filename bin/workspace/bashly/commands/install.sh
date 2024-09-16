inspect_args

WORKSPACE_DIR="$(workspace_dir)"

WORKSPACE_APP="$(workspace_app)"
WORKSPACE_YES="$(workspace_yes)"
WORKSPACE_AUTOMATIC="$(workspace_automatic)"

case "$WORKSPACE_APP" in
  "git")
    install_git
    ;;
  "docker")
    install_docker
    ;;
  "k3s")
    install_k3s
    ;;
  "minikube")
     install_minikube
     ;;
  "kube-tools")
     install_kubernetes_toolkit
     ;;
  "vals")
     install_vals
     ;; 
  "vscode")
     install_vscode
     ;;
  "all")
     install_git &&
     install_vscode &
     install_docker &&
     install_k3s &&
     install_kubernetes_toolkit &&
     install_vals
esac
