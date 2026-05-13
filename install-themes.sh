#!/bin/bash

function installArcGTKTheme(){
	echo "Installing Arc GTK theme..."
	git clone https://aur.archlinux.org/arc-gtk-theme.git ~/arc-gtk-theme
	cd ~/arc-gtk-theme
	makepkg -is --skippgpcheck
}

function installMintThemes(){
    git clone https://aur.archlinux.org/mint-themes.git ~/mint-themes
    cd ~/mint-themes
    makepkg -is
}

function installLightDMSettings(){
    cd /home/$USER
    git clone https://aur.archlinux.org/lightdm-settings.git
    cd /home/$USER/lightdm-settings
    makepkg -si
}

installArcGTKTheme
installMintThemes
installLightDMSettings
