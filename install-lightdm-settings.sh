#!/bin/bash

#this script installs LightDM settings manager from the AUR 

cd /home/$USER
git clone https://aur.archlinux.org/lightdm-settings.git

cd /home/$USER/lightdm-settings

makepkg -si