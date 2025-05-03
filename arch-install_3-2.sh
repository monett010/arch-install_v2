#!/bin/bash

# If the /boot/efi directory doesn't exist, create it.
if [ ! -d /boot/efi ]
then
echo 'Creating /boot/efi directory...'
mkdir /boot/efi
fi

read -p "What is the /boot/efi partition?" boot_

echo 'Mounting /boot/efi partition...'
mount "$boot_" /boot/efi

# setting up grub
echo 'Setting up GRUB...'
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

# If the /usr/share/images directory doesn't exist, create it before copying the GRUB wallpaper
if [ ! -d /usr/share/images ]
then
mkdir /usr/share/images
fi

echo 'Copying GRUB wallpaper...'
cp arch_wallpaper.png /usr/share/images/arch_wallpaper.png