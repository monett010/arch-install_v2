#!/bin/bash

source desktop_env.sh

# installing some important programs first...
echo "Installing some important programs first..."
pacman -S openssh tmux
systemctl enable sshd.service

echo "Installing video drivers..."
installVideoDrivers

read -p "What desktop environment will you be installing?
[1] budgie
[2] cinnamon
[3] gnome
[4] kde " desktop_env

case $desktop_env in
    "1")
        installDisplayManager budgie
        installDesktopEnv budgie
        installGTKThemes
        ;;
    "2")
        installDisplayManager cinnamon
        installDesktopEnv cinnamon
        installGTKThemes
        ;;
    "3")
        installDisplayManager gnome
        installDesktopEnv gnome
        installGTKThemes
        ;;
    "4")
        installDisplayManager kde
        installDesktopEnv kde
        ;;
esac

# installDisplayManager kde
# installDesktopEnv kde
# installGTKThemes

# echo "Installing other apps..."
read -p "Are there other apps you'd like to install?" other_apps
installOtherApps "$other_apps"

echo "Configuring Xorg..."
configureXorg

echo "Setting locale and hostname..."
setLocale

read -p "What would you like your hostname to be?" hostname_
setHostname "$hostname_"


# set root password
passwd
