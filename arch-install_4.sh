#!/bin/bash

# Ask if there's another disk you'd like to mount

function mountExtraPartitions () {
    read -p "Is there another partition you'd like to mount before generating fstab? y/n (default): " mount_extra
    if [ "$mount_extra" == "y" ]; then
        read -p "Please type the partition you'd like to mount: " partition
        read -p "Please type where you'd like to mount it (no preceding slashes): " location
        mount --mkdir "$partition" /mnt/"$location"

        read -p "Would you like to add another partition? y/n (default)" mount_another
        if [ "$mount_another" == "y" ]; then
            mountExtraPartitions
        fi
    fi
}
mountExtraPartitions
# generate fstab
echo "Generating fstab..."
genfstab -U /mnt >> /mnt/etc/fstab