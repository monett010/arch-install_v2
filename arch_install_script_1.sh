#!/bin/bash

mkdir /mnt
mkdir /mnt/boot
mkdir /mnt/boot/efi

read -p "What partition does /boot/efi go? " bootloader

read -p "What partition does / go? " root


mount "$root" /mnt
mount "$bootloader" /mnt/boot/efi

# installing linux kernel, headers, firmware, and base packages
echo 'Installing linux kernel, headers, firmware, and base packages...'
pacstrap -K /mnt linux linux-headers linux-firmware base base-devel 

arch-chroot /mnt


# # setting up graphics drivers and gui...
# echo 'Setting up graphics drivers and gui...'
# pacman -S intel-media-driver mesa xf86-video-amdgpu xf86-video-vmware libva-intel-driver vulkan-intel xf86-video-ati xorg-server libva-mesa-driver vulkan-radeon xorg-xinit
# pacman -S xorg lightdm lightdm-slick-greeter budgie budgie-desktop-view budgie-backgrounds network-manager-applet
# pacman -S caja mate-terminal
# pacman -S arc-gtk-theme papirus-icon-theme

# echo 'Configuring Xorg...'
# Xorg :0 -configure
# systemctl enable lightdm


# cd /etc

# # set the locale
# touch locale.conf
# echo "LANG=en_US.UTF-8" > locale.conf

# # make hostname
# touch hostname
# echo "blue-yoshi" > hostname

# cd /

# # set root password
# passwd

# echo "Don't forget to run arch_install_script_2.sh to setup GRUB and generate fstab next."

# exit

# # generate fstab
# genfstab -U /mnt >> /mnt/etc/fstab

# # setting up grub
# pacman -S grub efibootmgr
# grub-install --target=x86_64-efi --efi-directory=/mnt/boot/efi --bootloader-id=GRUB
# grub-mkconfig -o /boot/grub/grub.cfg