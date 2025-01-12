#!/bin/bash


# functions for installing video drivers and gui

function installVideoDrivers(){
	echo 'Setting up graphics drivers and gui...'
	pacman -S intel-media-driver mesa xf86-video-amdgpu xf86-video-vmware libva-intel-driver vulkan-intel xf86-video-ati xorg-server libva-mesa-driver vulkan-radeon xorg-xinit
}

function installDisplayManager(){

	case $1 in
		'lightdm')
			install_="xorg lightdm lightdm-gtk-greeter"
			;;
		'lightdm-slick')
			install_="xorg lightdm lightdm-slick-greeter lightdm-gtk-greeter"
			;;
		'gdm')
			install_="xorg gdm"
			;;
		'sddm')
			install_="xorg sddm sddm-kcm"
			;;
	esac
	echo "Installing display manager..."
	pacman -S $install_

	# enabling display manager
	case $1 in
		'lightdm')
			systemctl enable lightdm
			;;
		'lightdm-slick')
			systemctl enable lightdm
			;;
		'gdm')
			systemctl enable gdm
			;;
		'sddm')
			systemctl enable sddm
			;;
	esac

}

function installDesktopEnv(){
	case $1 in

	'budgie')
		install_="budgie budgie-desktop-view budgie-backgrounds network-manager-applet caja mate-terminal pluma kupfer plank xdg-user-dirs"
		;;
	'cinnamon')
		install_="cinnamon mate-terminal pluma kupfer plank"
		;;
	'kde')
		install_="plasma-desktop kde-utilities-meta kde-system-meta plasma-nm plasma-pa bluedevil kupfer"
		;;
	'kde-all')
	   install_="plasma"
		;;
	'gnome')
		install_="gnome"
		;;
	esac

	echo "Setting up Desktop Environment..."
	pacman -S $install_ firefox
	pacman -S networkmanager
	systemctl enable NetworkManager
}

function installGTKThemes(){
	pacman -S arc-gtk-theme papirus-icon-theme
}

function installOtherApps(){
	install_="flatpak neofetch neovim zsh python-virtualenv python-pip nodejs"
	pacman -S $install_ $1
}

# installs fonts. this was originally a part of installOtherApps()
function installFonts(){
	install_="ttf-meslo-nerd cascadia otf-cascadia-code ttf-cascadia-code ttf-cascadia-code-nerd"
	pacman -S $install_
}

function configureXorg(){
	echo 'Configuring Xorg...'
	Xorg :0 -configure
	cp /root/xorg.conf.new /etc/X11/xorg.conf
}

function setLocale(){
	# remove the default /etc/locale.gen. then copy over my uncommented version. this file has the correct US English UTF-8 locale uncommented.
	rm /etc/locale.gen
	cp locale.gen /etc
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
