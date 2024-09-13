#!/bin/bash

## Install and configure kubernetes tools, including:
## - kubectl
## - helm

# Include functions
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source "$DIR/functions.sh"

YESTOALL=$(yes_to_all "$1")

echo_info "Installing  and configuring kubernetes tools."

INSTALL_KUBECTL=0
if [ -e /usr/local/bin/kubectl ]
then
 echo_message "Kubectl is already installed."
 yes_or_no "Do you want to reinstall/upgrade it?" "$YESTOALL"
 INSTALL_KUBECTL=$?
fi

if [[ "$INSTALL_KUBECTL" = "0" ]]
 then
    echo_message "Installing kubectl"
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" &&
    sudo mv ./kubectl /usr/local/bin
    exit_if_error "Error installing kubectl"
fi

if [ -e /usr/local/bin/kubectl ]
then
  echo_message "Configuring kubectl autocompletion"
  kubectl completion bash > ~/.kubectl_completion &&
  echo "source ~/.kubectl_completion" >> ~/.bashrc &&
  source ~/.kubectl_completion
  exit_if_error "Error configuring kubectl autocompletion"
fi

if [ -e /etc/rancher/k3s/k3s.yaml ]
then
    yes_or_no "Do you want to configure kubectl to use k3s?" "$YESTOALL"
    if [[ $? -eq 0 ]]
    then
        echo_message "Configuring kubectl to use k3s"
        mkdir -p ~/.kube
        exit_if_error "Error configuring kubectl to use k3s"
        if [ -e ~/.kube/config ]
        then
            echo_message "Backing up existing kubectl configuration"
            mv ~/.kube/config ~/.kube/config.bak
            exit_if_error "Error configuring kubectl to use k3s"
        fi

        echo_message "Copying k3s configuration  as kubectl configuration"
        cp /etc/rancher/k3s/k3s.yaml ~/.kube/config &&
        chmod go-r ~/.kube/config &&
        kubectl config set-context default &&
        kubectl config use-context default
        exit_if_error "Error configuring kubectl to use k3s"
    else
        echo_message "Skipping k3s configuration"
    fi
fi


INSTALL_HELM=0

if [ -e /usr/local/bin/helm ]
then
 echo_message "Helm is already installed."
 yes_or_no "Do you want to reinstall/upgrade it?" "$YESTOALL"
 INSTALL_HELM=$?
fi

# Install helm
if [[ "$INSTALL_HELM" = "0" ]]
 then
    echo_message "Installing helm"
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 &&
    chmod 700 get_helm.sh &&
    ./get_helm.sh
    exit_if_error "Error installing helm"

    echo_message "Cleaning up"
    rm -f get_helm.sh
fi

# Configure helm completion
if [ -e /usr/local/bin/helm ]
then
  echo_message "Configuring helm autocompletion"
  helm completion bash > ~/.helm_completion &&
  echo "source ~/.helm_completion" >> ~/.bashrc &&
  source ~/.helm_completion
  exit_if_error "Error configuring helm autocompletion"
fi

# Install and configure helmfile
INSTALL_HELMFILE=0


if [ -e /usr/local/bin/helmfile ]
then
 echo_message "Helmfile is already installed."
 yes_or_no "Do you want to reinstall/upgrade it?" "$YESTOALL"
 INSTALL_HELMFILE=$?
else 
 yes_or_no "Do you want to install helmfile?" "$YESTOALL"
 INSTALL_HELMFILE=$?
fi

if [[ "$INSTALL_HELMFILE" = "0" ]]
 then
    echo_message "Installing helmfile"
    curl -fsSL -o get_helmfile.sh https://raw.githubusercontent.com/roboll/helmfile/master/scripts/get &&
    chmod 700 get_helmfile.sh &&
    ./get_helmfile.sh
    exit_if_error "Error installing helmfile"
 fi
