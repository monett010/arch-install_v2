#!/bin/bash

# This script installs Samba, wsdd, and Avahi, and then creates a Samba user.
# Meant to be run after install when user is logged in

echo "Installing Samba, wsdd, and Avahi..."
sudo pacman -S samba wsdd avahi --noconfirm

echo "Installing gvfs..."
sudo pacman -S gvfs gvfs-dnssd gvfs-goa gvfs-goa gvfs-google gvfs-gphoto2 gvfs-mtp gvfs-smb gvfs-wsdd --noconfirm

echo "Copying /etc/samba/smb.conf..."
# echo "[Public]
# comment = the public directory
# path = /home/morgan/Public
# public = yes
# guest ok = yes
# browseable = yes
# read only = no" >> smb.conf

sudo cp smb.conf /etc/samba/smb.conf 

echo "Enabling and starting smb, nmb, wsdd, and avahi-daemon services..."
sudo systemctl enable smb.service nmb.service wsdd.service avahi-daemon.service --now

read -p "What is your samba username?: " username
sudo smbpasswd -a "$username"