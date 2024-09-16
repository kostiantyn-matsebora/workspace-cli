#!/bin/bash

# Supported modes:
#  - interactive
#  - automatic
## Description:
##  - Install and configure kubernetes tools, including:
##    - kubectl
##    - helm
##    - helmfile

# Include functions
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source "$DIR/_functions.sh"

AUTOMATIC_MODE=$(is_automatic_mode "$1")

echo_info "Installing  and configuring kubernetes tools."

INSTALL_KUBECTL=0
if [ -e /usr/local/bin/kubectl ]
then
 echo_message "Kubectl is already installed."
 yes_or_no "Do you want to reinstall/upgrade kubectl?" "$AUTOMATIC_MODE"
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

INSTALL_HELM=0

if [ -e /usr/local/bin/helm ]
then
 echo_message "Helm is already installed."
 yes_or_no "Do you want to reinstall/upgrade helm?" "$AUTOMATIC_MODE"
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
 yes_or_no "Do you want to reinstall/upgrade helmfile?" "$AUTOMATIC_MODE"
 INSTALL_HELMFILE=$?
else 
 yes_or_no "Do you want to install helmfile?" "$AUTOMATIC_MODE"
 INSTALL_HELMFILE=$?
fi

if [[ "$INSTALL_HELMFILE" = "0" ]]
then
    echo_message "Installing helmfile"
    HELMFILE_URL="https://github.com/helmfile/helmfile/releases/download/v0.168.0/helmfile_0.168.0_linux_amd64.tar.gz" 
    DEST_DIR="/usr/local/bin"
    curl -L $HELMFILE_URL -o helmfile.tar.gz &&
    sudo tar -xzf helmfile.tar.gz -C $DEST_DIR &&
    rm helmfile.tar.gz
    exit_if_error "Error installing helmfile"
fi
