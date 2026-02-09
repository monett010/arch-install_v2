#!/bin/bash

# mkdir /mnt
mkdir /mnt/boot
mkdir /mnt/boot/efi

read -p "What partition does /boot/efi go? " bootloader_

read -p "What partition does / go? " root

mount "$bootloader_" /mnt/boot
mount "$root" /mnt

# installing linux kernel, headers, firmware, and base packages
# echo 'Installing linux kernel, headers, firmware, and base packages...'
# pacstrap -K /mnt linux linux-headers linux-firmware base base-devel nano vim pacman-contrib

read -p "Which kernel would you like to install?
[1] linux (default)
[2] linux lts " kernel_

case $kernel_ in
    "1")
        echo 'Installing linux kernel, headers, firmware, and base packages...'
        pacstrap -K /mnt linux linux-headers linux-firmware base base-devel dkms nano vim pacman-contrib
        ;;
    "2")
        echo 'Installing linux-lts kernel, headers, firmware, and base packages...'
        pacstrap -K /mnt linux-lts linux-lts-headers linux-firmware base base-devel dkms nano vim pacman-contrib
        ;;
    *)
        echo 'Installing linux kernel, headers, firmware, and base packages...'
        pacstrap -K /mnt linux linux-headers linux-firmware base base-devel dkms nano vim pacman-contrib
        ;;
esac


cp -r ~/arch-install_v2 /mnt

arch-chroot /mnt