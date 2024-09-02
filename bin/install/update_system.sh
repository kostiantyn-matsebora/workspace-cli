#! /bin/bash

echo "Update packages to latest version"

apt update && apt upgrade

if [ "$?" -ne "0" ]
then
 echo "Error occured during update of system"
 exit 1
fi

echo "Beautify Grub menu"
apt install --reinstall -o Dpkg::Options::="--force-confmiss" grub2-theme-mint2k
