
#!/bin/bash
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source "$DIR/functions.sh"

YESTOALL=$(yes_to_all "$1")

# Install minikube (driver=docker runtime=containerd)
yes_or_no "Do you want to install minikube (driver=docker containerd and all depedencies?" "$YESTOALL"

exit_if_answer_no

INSTALL_MINIKUBE=0

if [ -e /usr/local/bin/minikube ]
then
 echo_message "Minikube is already installed."
 yes_or_no "Do you want to reinstall it?" "$YESTOALL"
 INSTALL_MINIKUBE=$?
fi

if [[ "$INSTALL_MINIKUBE" = "0" ]]
then
    echo_message "Installing Minikube"
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    sudo install minikube-linux-amd64 /usr/local/bin/minikube && 
    rm minikube-linux-amd64 &&

    echo_message "Making docker default driver for minikube" &&
    minikube config set driver docker &&

    echo_message "Making containerd default container runtime for minikube" &&
    minikube config set container-runtime containerd

    exit_if_error "Error installing and configuring Minikube"
fi

echo_message "Minikube installation and configuration is completed."
echo_message "If you already have VMs, you need to delete them using command: minikube delete"
echo_message "To run minikube, use command: minikube start"

