## Arch Install Scripts (Budgie Desktop Environment)



1. Boot into the live disk and make sure you're connected to the Internet
       To connect to the internet (source: https://www.reddit.com/r/archlinux/comments/kj65gc/how_to_connect_to_wifi_when_installing_arch/ )
   
   ```bash
   
   iwctl
   
   station list
   
   station [device] get-networks
   station [device] connect [SSID]
   
   ```

2. Install Git using ``pacman -S git`` (or ``pacman -Sy git`` if it complains), then clone the arch-install repository into the live disk - https://github.com/monett010/arch-install.git

3. Run ``lsblk`` to make note of what partitions and disks you want to use for your /boot/efi and / 

4. Run ``arch-install_1.sh`` to install linux kernel and base apps.

5. It should copy automatically, but if it doesn't, copy the ``arch-install`` folder to your new installation (/mnt), then ``arch-chroot`` into /mnt 

6. From chroot, run ``arch-install_1-2.sh`` to install the graphics drivers and desktop environment.

7. Edit ``greeter-session`` in lightdm config file ``(/etc/lightdm/lightdm.conf)`` to say ``lightdm-slick-greeter`` if you want to use slick greeter

8. Run ``arch-install_2.sh`` to setup GRUB bootloader.

9. Edit your grub config file, ``/etc/default/grub``. add 
   
   ```plaintext
   root=/dev/[sdyourrootpartition]
   ```
   
   then run 
   
   ```bash
   grub-mkconfig -o /boot/grub/grub.cfg
   ```
   
   

10. Run ``arch-install_3.sh`` to add your user account and create directories in home folder. 

11. Do ``su``, then ``visudo`` to edit the sudoers file. Uncomment the line that lets any account in the wheel group perform any action. Save it and exit.

12. Exit chroot

13. Run ``arch-install_4.sh`` to generate your /etc/fstab file.

14. Reboot into your newly installed Arch Linux system.



---

Do this if you have a problem with gpg keys being signed:

source: [pacman required key missing from keyring / Pacman &amp; Package Upgrade Issues / Arch Linux Forums](https://bbs.archlinux.org/viewtopic.php?id=187746)

```bash

pacman-key --init

pacman-key --populate

pacman-key --refresh-keys

pacman -Sy archlinux-keyring

```


