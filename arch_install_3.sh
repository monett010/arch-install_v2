#!/bin/bash

# setting up user and home dir...
pacman -S sudo
useradd -m -G wheel -s /usr/bin/bash morgan
passwd morgan

pacman -S xdg-user-dirs

exit
