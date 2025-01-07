#!/bin/bash

source desktop_env.sh

# installing some important programs first...
echo "Installing some important programs (Git, SSH, and Tmux) first..."
pacman -S git openssh tmux
systemctl enable sshd.service

echo "Installing video drivers..."
installVideoDrivers

read -p "Which greeter will you be installing?
[1] lightdm
[2] lightdm slick greeter
[3] gdm (GNOME)
[4] sddm (KDE)" greeter_

case $greeter_ in
    '1')
        installDisplayManager lightdm
        ;;
    '2')
        installDisplayManager lightdm-slick
        ;;
    '3')
        installDisplayManager gdm
        ;;
    '4')
        installDisplayManager sddm
        ;;
esac

read -p "What desktop environment will you be installing?
[1] budgie
[2] cinnamon
[3] gnome
[4] kde " desktop_env

case $desktop_env in
    "1")
        # installDisplayManager budgie
        installDesktopEnv budgie
        installGTKThemes
        ;;
    "2")
        # installDisplayManager cinnamon
        installDesktopEnv cinnamon
        installGTKThemes
        ;;
    "3")
        # installDisplayManager gnome
        installDesktopEnv gnome
        installGTKThemes
        ;;
    "4")
        # installDisplayManager kde
        installDesktopEnv kde
        ;;
esac

# installDisplayManager kde
# installDesktopEnv kde
# installGTKThemes

echo "Installing fonts..."
installFonts

# echo "Installing other apps..."
read -p "Installing Firefox, Flatpak, Neofetch, NeoVim, Zsh, Python Virtualenv, Python Pip, NodeJS, NTFS drivers, and Cascadia fonts. Are there other apps you'd like to install?" other_apps
installOtherApps "$other_apps"

echo "Configuring Xorg..."
configureXorg

echo "Setting locale and hostname..."
setLocale

read -p "What would you like your hostname to be?" hostname_
setHostname "$hostname_"


# set root password
passwd
