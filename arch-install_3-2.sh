#!/bin/bash

echo 'Creating /boot/efi directory...'
mkdir /boot/efi

read -p "What is the /boot/efi partition?" boot

echo 'Mounting /boot/efi partition...'
mount "$boot" /boot/efi

# setting up grub
echo 'Setting up GRUB...'
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
