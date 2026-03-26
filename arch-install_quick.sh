#!/bin/bash

source /arch-install_v2/desktop_env.sh

# installing some important programs first...
echo "Installing some important programs (Git, SSH, Wget, and Tmux) first..."
pacman -S git openssh wget tmux
systemctl enable sshd.service

# installing NTFS driver
echo "Installing NTFS driver..."
pacman -S ntfs-3g

echo "Installing video drivers..."
installVideoDrivers

read -p "Which greeter will you be installing?
[1] none (default)
[2] lightdm
[3] lightdm slick greeter
[4] gdm (GNOME)
[5] sddm (KDE) " greeter_

case $greeter_ in
    '1')
        echo 'No greeter will be installed.'
        ;;
    '2')
        installDisplayManager lightdm
        ;;
    '3')
        installDisplayManager lightdm-slick
        ;;
    '4')
        installDisplayManager gdm
        ;;
    '5')
        installDisplayManager sddm
        ;;
    *)
        echo 'No greeter will be installed.'
        ;;
esac

read -p "What desktop environment will you be installing?
[1] none (default)
[2] budgie
[3] cinnamon
[4] gnome
[5] kde (minimal)
[6] kde (kitchen sink) " desktop_env

case $desktop_env in
    "1")
        echo "No desktop environment will be installed. Installing NetworkManager."
       	pacman -S networkmanager
        systemctl enable NetworkManager
        ;;
    "2")
        # installDisplayManager budgie
        installDesktopEnv budgie
        installGTKThemes
        echo "Configuring Xorg..."
        configureXorg
        ;;
    "3")
        # installDisplayManager cinnamon
        installDesktopEnv cinnamon
        installGTKThemes
        echo "Configuring Xorg..."
        configureXorg
        ;;
    "4")
        # installDisplayManager gnome
        installDesktopEnv gnome
        installGTKThemes
        echo "Configuring Xorg..."
        configureXorg
        ;;
    "5")
        # installDisplayManager kde
        installDesktopEnv kde
        echo "Configuring Xorg..."
        configureXorg
        ;;
    "6")
        installDesktopEnv kde-all
        echo "Configuring Xorg..."
        configureXorg
        ;;
    *)
        echo "No desktop environment will be installed. Installing NetworkManager."
       	pacman -S networkmanager
        systemctl enable NetworkManager
        ;;
esac

# installDisplayManager kde
# installDesktopEnv kde
# installGTKThemes

read -p "Would you like to install Meslo and Cascadia nerd fonts? (y/n) " _do_fonts

if [ "$_do_fonts" == "y" ]; then 
    echo "Installing Meslo and Cascadia fonts..."
    installFonts
fi

# echo "Installing other apps..."
echo "Installing Flatpak, Fastfetch, NeoVim, Zsh, Python Virtualenv, Python Pip, and NodeJS."
installOtherApps

read -p  "Any other apps you'd like to install? (input apps, or press enter for none): " other_apps

if [ -n "$other_apps" ]; then
    pacman -S "$other_apps"
fi

function setLocale(){
	# remove the default /etc/locale.gen. then copy over my uncommented version. this file has the correct US English UTF-8 locale uncommented.
	rm /etc/locale.gen
	cp arch-install_v2/locale.gen /etc
	# run locale-gen
	locale-gen
	# set the locale
	touch /etc/locale.conf
	echo "LANG=en_US.UTF-8" > /etc/locale.conf
}

function setHostname(){
	# make hostname
	touch /etc/hostname
	echo "$1" > /etc/hostname
}

echo "Setting locale and hostname..."
setLocale

read -p "What would you like your hostname to be?" hostname_
setHostname "$hostname_"

# set root password
echo "Setting the root password..."
passwd

# setting up user and home dir...

function createUser () {
  read -p "Username for new user:" _username
  useradd -m -G wheel -s /usr/bin/bash "$_username"
  passwd "$_username"

  read -p "Would you like to create another user? y/n (default)" create_another

  if [ "$create_another" == "y" ]; then
    createUser
  fi
}

createUser

echo "Don't forget to run visudo to give sudo privileges to users."