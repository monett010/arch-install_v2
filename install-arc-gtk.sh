function installArcGTKTheme(){
	echo "Installing Arc GTK theme..."
	git clone https://aur.archlinux.org/arc-gtk-theme.git /arc-gtk-theme
	cd /arc-gtk-theme
	makepkg -is --skippgpcheck
}

installArcGTKTheme