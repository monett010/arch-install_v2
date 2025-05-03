#!/bin/bash

# mkdir /mnt
mkdir /mnt/boot
mkdir /mnt/boot/efi

read -p "What partition does /boot/efi go? " bootloader_

read -p "What partition does / go? " root

mount "$bootloader_" /mnt/boot
mount "$root" /mnt

# installing linux kernel, headers, firmware, and base packages
echo 'Installing linux kernel, headers, firmware, and base packages...'
pacstrap -K /mnt linux linux-headers linux-firmware base base-devel nano vim pacman-contrib

cp -r ~/arch-install_v2 /mnt

arch-chroot /mnt