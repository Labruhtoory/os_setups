#!/bin/bash

echo 'keep in mind the default answer is yes...'
read -p 'Full? y/n> ' full

echo 'adding apt repo'
#repo
echo "" > /etc/apt/sources.list
apt-key adv --keyserver pool.sks-keyservers.net --recv-keys ED444FF07D8D0BF6
echo '# Kali linux repositories | Added by Katoolin' >> /etc/apt/sources.list
echo 'deb http://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list
apt-get update
sudo apt install -fy python python3 python3-pip golang nasm default-jdk

#programming language support
sudo python3 -m pip install --upgrade pip

echo 'moving to /opt'
#init
mkdir /webtmp

#networking
echo "nameserver 1.1.1.1" > /etc/resolv.conf
echo "nameserver 1.0.0.1" >> /etc/resolv.conf

if [ $full == "n" ] 
then
  echo "OK, Please choose you packages (y/n)..."
  read -p 'Cloud?> ' cloud
  read -p 'Anon?> ' anon
  read -p 'Hosting?> ' hosting
  read -p 'Sec?> ' sec
  if [ $(cloud) == 'n' ]
  then
  echo 'No Clouds...'
  if [ $(anon) == 'n' ]
  then
  echo 'No Anon...'
  else
  sudo apt install -fy openvpn tor proxychains
  fi
  if [ $(hosting) == 'n' ]
  then
  echo 'No Hosting...'
  else
  sudo apt install nginx

  fi
  if [ $(sec) == 'n' ]
  then
  echo 'No sec...'
  else
  sudo apt install -fy nikto dmitry dnstracer dirb dirbuster gobuster exiftool binwalk radare2 gdb 
  #dirsearch
  git clone https://github.com/maurosoria/dirsearch.git
  
  #photon
  git clone https://github.com/s0md3v/Photon.git
  fi				

else
  echo "OK, installing all packages"
  sudo apt install -fy python python3 python3-pip golang nasm default-jdk openvpn tor proxychains nginx nikto dmitry dnstracer dirb dirbuster gobuster exiftool binwalk radare2 gdb

  #dirsearch
  git clone https://github.com/maurosoria/dirsearch.git

  #photon
  git clone https://github.com/s0md3v/Photon.git
fi

#wireless drivers
apt install -y build-essential libelf-dev linux-headers-`uname -r`
apt install -y realtek-rtl88xxau-dkms
git clone https://github.com/aircrack-ng/rtl8812au.git
cd rtl8812au/
make && make install
cd /opt/

chmod -R 777 /opt/
reboot now
