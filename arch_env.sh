# cfdisk /dev/sda

'''
sda1 –> 1M – BIOS_boot
sda2 –> 4G – Linux swap
sda3 –> 16G – Linux filesystem
Write Changes & Quit
'''

# mkfs.ext4 /dev/sda3
# mkswap /dev/sda2
# swapon -a

# mount /dev/sda3 /mnt
# pacstrap /mnt base linux linux-firmware nano grub dhcpcd 
# genfstab /mnt >> /mnt/etc/fstab

# arch-chroot /mnt
# passwd
# grub-install /dev/sda
# grub-mkconfig -o /boot/grub/grub.cfg
# exit
# reboot

# systemctl start dhcpcd
# systemctl enable dhcpcd
# nano /etc/pacman.conf

'''
Delete the 2 # symbols that precede:
[multilib] and
Include = /etc/pacman.d/mirrorlist
Save and Exit
'''

# pacman -Syy



## Desktop
sudo pacman -Rscn gnome
pacman -S --needed xfce4 mousepad parole ristretto thunar-archive-plugin thunar-media-tags-plugin xfce4-battery-plugin xfce4-datetime-plugin xfce4-mount-plugin xfce4-netload-plugin xfce4-notifyd xfce4-pulseaudio-plugin xfce4-screensaver xfce4-taskmanager xfce4-wavelan-plugin xfce4-weather-plugin xfce4-whiskermenu-plugin xfce4-xkb-plugin file-roller network-manager-applet leafpad epdfview galculator lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings capitaine-cursors arc-gtk-theme xdg-user-dirs-gtk

# setting resolution of display
  touch screenres.sh
  echo 'xrandr --newmode "1920x1080"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync' > screenres.sh
  echo 'xrandr --addmode Virtual1 1920x1080' >> screenres.sh
  echo 'xrandr --output Virtual1 --mode 1920x1080' >> screenres.sh
  chmod +x screenres.sh
  bash screenres.sh

# hide desktop icons
  xfconf-query -c xfce4-desktop -np '/desktop-icons/style' -t 'int' -s '0'

# Apps

pacman -S sudo terminator tmux discord spotifyd thunderbird libreoffice-fresh libreoffice-sdk audacity
