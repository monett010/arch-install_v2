#!/bin/bash

# This script installs the mint-themes package on Arch Linux

git clone https://aur.archlinux.org/mint-themes.git ~/mint-themes
cd ~/mint-themes
makepkg -is