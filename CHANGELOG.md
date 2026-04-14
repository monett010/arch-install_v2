# CHANGELOG

## Mar 2026
- Now, you will be prompted to optionally mount other partitions before generating fstab
- Added scripts to optionally install Arc GTK Theme, Mint Themes, and Samba after install 
- There is now a reminder to give sudo privileges after user creation
- Bluetooth (blueman), touch gestures (touchegg), and xdg-user-dirs have now been added to the Cinnamon install
- Fixed bug in which other apps install prompt reads multiple arguments as only one

## Feb 2026
- Now, you can choose to install either linux or linux-lts kernels
- Desktop environment install is more readable and user friendly
- Improved GRUB install: now asks if you want to edit /etc/default/grub directly after install and opens the file
- Replaced neofetch with fastfetch, as neofetch is no longer in the Arch repos
- Locale generation, hostname creation, and root password creation are now in the same script as user creation