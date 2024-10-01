#! /bin/bash

cleanup_system() {
    AUTOMATIC_MODE=$(is_automatic_mode "$1")
    # Running autoremove to remove unnecessary packages
    echo "Running autoremove"
    sudo apt-get autoremove -y


    # Removing apt package cache
    echo "Removing apt package cache"
    sudo apt-get clean

    # Getting the size of journalctl logs
    echo "Getting the size of journalctl logs"
    journalctl --disk-usage

    yes_or_no "Do you really want to remove journalctl logs older than 3 days?" "$AUTOMATIC_MODE"
    if [[ $? -eq 0 ]]
    then
        # Removing journalctl logs older than 3 days
        echo "Removing journalctl logs older than 3 days"
        sudo journalctl --vacuum-time=3d
    fi

    # Getting list of timeshift snapshots
    if [ -e /usr/bin/timeshift ]
    then
        echo "Getting list of timeshift snapshots"
        sudo timeshift --list

        echo "Use timeshift delete --snapshot 'snapshot_name' to delete a snapshot"
        echo "Also you can use sudo rm -rfv /timeshift/snapshots/snapshot_name to delete a snapshot"
    fi
   
}
