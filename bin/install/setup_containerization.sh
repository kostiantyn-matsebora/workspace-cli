#!/bin/bash

# Include functions
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source "$DIR/functions.sh"

echo_info "Installing and configuring containerization tools"

# Install containerization tools
# https://rootlesscontaine.rs/getting-started/docker/
yes_or_no "Do you want to install rootless docker (docker + containerd + buildkit)?"

if [ $? -eq 0 ] 
then
    # Install dependencies
   echo_message "Installing docker"
   curl -o install.sh -fsSL https://get.docker.com
   sudo sh install.sh
   exit_if_error "Error installing docker"

   # Setup rootless docker
    echo_message "Setting up rootless docker"
    dockerd-rootless-setuptool.sh install
fi

# Install minikube and all dependencies
yes_or_no "Do you want to install minikube and all depedencies?"

exit_if_answer_no

echo_message "Installing libvirt-clients"
apt install libvirt-clients -y

exit_if_error "Error installing libvirt-clients"

echo_message "Validating virtual host"
virt-host-validate

if [ $? -ne 0 ]
then
 echo_error "Virtual host validation has some errors, probably you would like to fix them."

 yes_or_no "Do you want to continue?"

 exit_if_answer_no
fi

echo_message "Checking if nested virtualization is enabled"

RESULT=$(cat /sys/module/kvm_intel/parameters/nested)
if [[ $RESULT = "Y" || $RESULT = "1" ]]
then
 echo_message "Nested virtualization is enabled."
else
 echo_message "Enabling nested virtualization"
 
 sudo modprobe -r kvm_intel  &&
 sudo modprobe kvm_intel nested=1 &&
 sudo sh -c "echo \"options kvm_intel nested=1\" > /etc/modprobe.d/kvm.conf"

 exit_if_error "Error enabling nested virtualization" 
fi

echo_message "Installing KVM"
sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager -y
exit_if_error "Error installing KVM"

echo_message "Adding user to libvirt group"
sudo usermod -aG libvirt "$USER" &&
sudo usermod -aG kvm "$USER"

exit_if_error "Error adding user to libvirt group"

INSTALL_MINIKUBE=0

if [ -e /usr/local/bin/minikube ]
then
 echo_message "Minikube is already installed."
 yes_or_no "Do you want to reinstall it?"
 INSTALL_MINIKUBE=$?
fi

if [[ "$INSTALL_MINIKUBE" = "0" ]]
then
    echo_message "Installing Minikube"
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    sudo install minikube-linux-amd64 /usr/local/bin/minikube && 
    rm minikube-linux-amd64 &&

    echo_message "Making kvm2 default driver for minikube" &&
    minikube config set driver kvm2 &&

    echo_message "Making containerd default container runtime for minikube" &&
    minikube config set container-runtime containerd

    exit_if_error "Error installing and configuring Minikube"    
fi

INSTALL_KUBECTL=0
if [ -e /usr/local/bin/kubectl ]
then
 echo_info "Kubectl is already installed."
 yes_or_no "Do you want to reinstall/upgrade it?"
 INSTALL_KUBECTL=$?
fi

if [[ "$INSTALL_KUBECTL" = "0" ]]
 then
    echo_message "Installing kubectl"
    sudo apt install kubectl -y
fi

exit_if_error "Error installing kubectl"

echo_message "Containerization installation and configuration is completed."
echo_message "If you already have VMs, you need to delete them using command: minikube delete"
echo_message "To run minikube, use command: minikube start"
