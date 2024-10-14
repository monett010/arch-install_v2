#!/bin/bash

# this should be run as chroot
# setting up grub
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

# echo "Don't forget to add your root directory to your grub config file (/etc/default/grub)"