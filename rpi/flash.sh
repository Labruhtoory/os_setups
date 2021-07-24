#!/bin/bash

read -p "What is the full path to the rpi os image? " dir
read -p "What is the name of the folder that you would like to mount to? " mdir
read -p "Would you like to enable ssh? " sshen

echo "Setting up drive partition....."
echo "Please insert a drive with the desired (EMPTY) partition to use....."
lsblk | grep "disk\|part"
echo "Have you plugged in a drive? If not, now is the time to do it....."
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
read -p "What is the label of the partition to use? (Ex: sdb1, sdc1) " drivep
echo ""
echo ""
echo "Cleaning partition..."
mkfs.ext4 /dev/$drivep
echo ""
echo ""
echo "Copying files..."
dd if=$dir of=/dev/$drivep bs=2M
echo ""
echo ""
if [[ $sshen = y ]] ; then
	echo "Enabling ssh..."
	sudo mkdir /rpidrive
	sudo mount /dev/$drivep /rpidrive
  	touch /rpidrive/ssh
	clear
	ls /rpidrive
	umount /dev/$drivep
fi


clear
echo "Image Flashed: $dir"
echo "Mount Location: /$mdir"
if [[ $sshen = y ]] ; then
	echo "SSH: enabled"
else
  echo "SSH: not enabled"
fi
echo "Processed delayed for performing a user-confirmation..."
echo "Continuing will umount the volume, making it safe to eject..."
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
echo "Done!"
