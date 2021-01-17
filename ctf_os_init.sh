#!/bin/bash

#init
mkdir server
mkdir /ctf
mkdir /thm
mkdir /htb
mkdir /ctf/koth
dpkg-reconfigure kali-grant-root
git clone https://github.com/Labruhtooryboi/Wargames.git

#wireless drivers
apt install -y build-essential libelf-dev linux-headers-`uname -r`
apt install -y realtek-rtl88xxau-dkms
git clone https://github.com/aircrack-ng/rtl8812au.git
cd rtl8812au/
make && make install
cd /opt/
					##dependencies

#java jdk
apt install -y default-jdk
#dotnet
wget https://download.visualstudio.microsoft.com/download/pr/ec187f12-929e-4aa7-8abc-2f52e147af1d/56b0dbb5da1c191bff2c271fcd6e6394/dotnet-sdk-3.1.404-linux-x64.tar.gz
mkdir -p $HOME/dotnet && tar zxf dotnet-sdk-3.1.404-linux-x64.tar.gz -C $HOME/dotnet
export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet
rm -rf /opt/dotnet-sdk-3.1.404-linux-x64.tar.gz
rm -rf /opt/rustscan_2.0.1_amd64.deb





					##standalones

#sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text


#tor
echo 'deb https://deb.torproject.org/torproject.org stretch main
deb-src https://deb.torproject.org/torproject.org stretch main' > /etc/apt/sources.list.d/tor.list
wget -O- https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | sudo apt-key add -
apt update
apt-get install -y tor deb.torproject.org-keyring

#rphp
wget https://github.com/pentestmonkey/php-reverse-shell/blob/master/php-reverse-shell.php 

#pspy
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy32
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64


#linenum
wget https://github.com/rebootuser/LinEnum/blob/master/LinEnum.sh


#kerbrute
wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64
mv kerbrute_linux_amd64 /usr/bin/kerbrute




					##installers

wget https://github.com/RustScan/RustScan/releases/download/2.0.1/rustscan_2.0.1_amd64.deb
dpkg -i rustscan_2.0.1_amd64.deb




					##source code tools


#linpeas
git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git
mkdir peas
mv privilege-escalation-awesome-scripts-suite/* peas/
rm -rf privilege-escalation-awesome-scripts-suite/

#PSEmpire
git clone https://github.com/EmpireProject/Empire.git

#ILSpy decompiler
git clone https://github.com/icsharpcode/ILSpy.git

#poor mans pentest
gti clone https://github.com/JohnHammond/poor-mans-pentest.git
mkdir pmp
mv poor-mans-pentest/* pmp/
rm -rf poor-mans-pentest

#dirsearch
git clone https://github.com/maurosoria/dirsearch.git

#phoninfoga
curl -sSL https://raw.githubusercontent.com/sundowndev/PhoneInfoga/master/support/scripts/install | bash
mv ./phoneinfoga /usr/bin/phoneinfoga


##more setup


mv LinEnum.sh /opt/server
cp peas/linPEAS/linpeas.sh /opt/server/
mv pspy64 /opt/server/
mv pspy32 /opt/server
mv php-reverse-shell.php rphp.php
mv rphp.php /opt/server/

#setting resolution of display
touch screenres.sh
echo 'xrandr --newmode "1920x1080"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync' > screenres.sh
echo 'xrandr --addmode Virtual1 1920x1080' >> screenres.sh
echo 'xrandr --output Virtual1 --mode 1920x1080' >> screenres.sh
chmod +x screenres.sh

#bash_aliases
cp backs/bash_aliases.txt /root/.bash_aliases
source /root/.bash_aliases

#bash.rc
rm -rf /home/lab/.bashrc
mv backs/u.bashrc /home/lab/.bashrc
source /home/lab/.bashrc

rm -rf /root/.bashrc
mv backs/r.bashrc /root/.bashrc
source /root/.bashrc

rm -rf /opt/init.sh
rm -rf /opt/backs
reboot now
