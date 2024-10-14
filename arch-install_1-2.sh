#!/bin/bash

source desktop_env.sh

# installing some important programs first...
echo 'Installing some important programs first...'
pacman -Sp nano vim sudo openssh tmux
systemctl enable sshd.service

installVideoDrivers
installDisplayManager kde
installDesktopEnv kde
# installGTKThemes
installOtherApps

configureXorg
setLocale
setHostname test-arch


# set root password
passwd
