#!/bin/bash


read -p "What partition does / go?" root_ 

echo 'Unmounting partitions...'
umount /mnt

umount /mnt/boot/efi

echo 'Remounting root partition...'
mount "$root_" /mnt

arch-chroot /mnt

