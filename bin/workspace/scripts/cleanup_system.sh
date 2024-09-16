#! /bin/bash

# Running autoremove to remove unnecessary packages
echo "Running autoremove"
sudo apt-get autoremove -y


# Removing apt package cache
echo "Removing apt package cache"
sudo apt-get clean

# Getting the size of journalctl logs
echo "Getting the size of journalctl logs"
journalctl --disk-usage

# Removing journalctl logs older than 3 days
echo "Removing journalctl logs older than 3 days"
sudo journalctl --vacuum-time=3d


STACER_INSTALLED="N"
# Checking if stacer is installed
if [ -e /usr/bin/stacer ]
then 
	echo "Stacer is installed"
	STACER_INSTALLED="Y"
else
	read -sn 1 -p "Do you want to install stacer? [y/n]" INSTALL_STACER
 	echo -e "\n"
	if [[ "$INSTALL_STACER" = "Y" || "$INSTALL_STACER" = "y" ]]
	then
		# Installing stacer
		echo "Installing stacer"
		sudo apt-get install stacer -y
		if [ "$?" -eq "0" ]
		then
			STACER_INSTALLED="Y"
		fi
	fi
fi

if [[ "$STACER_INSTALLED" = "Y" ]]
then
	read -sn 1 -p "Do you want to run stacer to clean up system?" RUN_STACER
	if [[ "$RUN_STACER" = "Y" || "$RUN_STACER" = "y" ]]
	then
		stacer &
	fi
fi

# Getting list of timeshift snapshots
echo "Getting list of timeshift snapshots"
sudo timeshift --list

echo "Use timeshift delete --snapshot 'snapshot_name' to delete a snapshot"
echo "Also you can use sudo rm -rfv /timeshift/snapshots/snapshot_name to delete a snapshot"
