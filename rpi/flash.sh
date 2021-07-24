#!/bin/bash

read -p "What is the full path to the rpi os image? " dir
read -p "What is the name of the folder that you would like to mount to? " mdir
read -p "Would you like to enable ssh? " sshen

echo "Setting up drive partition....."
echo "Please insert a drive with the desired (EMPTY) partition to use....."
lsblk | grep "disk\|part"
echo "Have you plugged in a device? If not, now is the time to do it....."
echo "Press 'c' to continue....."
while : ; do
read -n 1 k <&1
if [[ $k = c ]] ; then
	echo ""
printf "Ok then, moving on....."
break
fi
done
clear
lsblk | grep "disk\|part"
echo ""
read -p "What is the new partition to use?" drivep
mkfs.ext4 /dev/$drivep
echo "mounting $drivep"
sudo mkdir /$mdir
sudo mount /dev/$drivep /$mdir
echo "/dev/$drivep        /$mdir       ext4    defaults      0      0" >> /etc/fstab
echo "Ok, /dev/$drivep has been prepped with an ext4 filsystem for mounting on boot"
clear

echo "Ok, flashing image now..."
sudo dd if=$dir of$answ bs=2M
clear

if [[ $sshen = y ]] ; then
	echo "Enabling ssh..."
  touch /rpidrive/ssh
fi


clear
echo "Image Flashed: $dir"
echo "Mount Location: /$mdir"
if [[ $sshen = y ]] ; then
	echo "SSH: enabled"
else
  echo "SSH: not enabled"
fi
