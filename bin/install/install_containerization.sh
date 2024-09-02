#! /bin/bash

read -sn 1 -p "Do you want to install nerdctl+containerd+buildKit" ANSWER

if [[ "$ANSWER" = "y" || "$ANSWER" = "Y" ]]
then
    echo "Installing containerd"
    sudo apt install -y containerd
    if [ "$?" -ne "0" ]
    then
        echo "Error installing containerd"
        exit $?
    fi

fi

read -sn 1 -p "Do you want to install minikube and all depedencies [y/n]" ANSWER

if [[ "$ANSWER" != "y" && "$ANSWER" != "Y" ]]
then
    echo -e "\nExiting..."
    exit 0
fi

echo "Installing libvirt-clients"
apt install libvirt-clients -y

if [ "$?" -ne "0" ]
then
 exit $?
fi

echo "Validating virtual host"
virt-host-validate

if [ "$?" -ne "0" ]
then
 echo "Virtual host validation has some errors, probably you would like to fix them."
 read -sn 1 -p "Do you want to continue? [y/n]" ANSWER

 if [[ "$ANSWER" != "y" && "$ANSWER" != "Y" ]]
 then
  echo -e "\nExiting..."
  exit 1
 fi
fi

echo "Checking if nested virtualization is enabled"

RESULT=$(cat /sys/module/kvm_intel/parameters/nested)
if [[ $RESULT = "Y" || $RESULT = "1" ]]
then
 echo "Nested virtualization is enabled"
else
 echo "Enabling nested virtualization"
 sudo modprobe -r kvm_intel  &&
 sudo modprobe kvm_intel nested=1 &&
 sudo sh -c "echo \"options kvm_intel nested=1\" > /etc/modprobe.d/kvm.conf"

 if [ "$?" -ne "0" ]
 then
   echo "Error enabling nested virtualization"
   exit $?
 fi

fi

echo "Installing KVM"
sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager -y
if [ "$?" -ne "0" ]
then
 echo "Error installing KVM"
 exit $?
fi

echo "Adding user to libvirt group"
sudo usermod -aG libvirt "$USER" &&
sudo usermod -aG kvm "$USER"

if [ "$?" -ne "0" ]
then
 echo "Error adding user to libvirt group"
 exit $?
fi

INSTALL_MINIKUBE=Y

if [ -e /usr/local/bin/minikube ]
then
 echo "Minikube is already installed."
 read -sn 1 -p "Do you want to reinstall it? [y/n]" INSTALL_MINIKUBE
 echo -e "\n"
fi

if [[ "$INSTALL_MINIKUBE" = "Y"  || "$INSTALL_MINIKUBE" = "y" ]]
then
    echo -e "Installing Minikube"
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    sudo install minikube-linux-amd64 /usr/local/bin/minikube && 
    rm minikube-linux-amd64 &&

    echo "Making kvm2 default driver for minikube" &&
    minikube config set driver kvm2 &&

    echo "Making containerd default container runtime for minikube" &&
    minikube config set container-runtime containerd

    if [ "$?" -ne "0" ]
    then
        echo "Error installing  and configuring Minikube"
        exit $?
    fi
fi

INSTALL_KUBECTL=Y
if [ -e /usr/local/bin/kubectl ]
then
 echo "Kubectl is already installed."
 read -sn 1 -p "Do you want to reinstall/upgrade it? [y/n]" INSTALL_KUBECTL
 echo -e "\n"
fi

if [[ "$INSTALL_KUBECTL" = "y" ||"$INSTALL_KUBECTL" = "Y" ]]
 then
    echo -e "Installing kubectl"
    sudo apt install kubectl -y
fi

echo "Containerization installation and configuration is completed."
echo "If you already have VMs, you need to delete them using command: minikube delete"
echo "To run minikube, use command: minikube start"
