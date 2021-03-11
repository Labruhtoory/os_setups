#!/bin/bash

#repo
echo "" > /etc/apt/sources.list
apt-key adv --keyserver pool.sks-keyservers.net --recv-keys ED444FF07D8D0BF6
echo '# Kali linux repositories | Added by Katoolin' >> /etc/apt/sources.list
echo 'deb http://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list
apt-get update

#upfront apt stuff
sudo apt install -fy wireshark kali-menu python3 python3-pip sqlitebrowser golang terminator openvpn gnome-tweaks exiftool nasm binwalk default-jdk radare2 gdb gqrx-sdr clusterssh audacity neo4j tor torbrowser-launcher nmap masscan exploitdb armitage set nikto osrframework recon-ng netdiscover legion voiphopper zaproxy enum4linux dmitry dnsrecon dnstracer theharvester thc-ipv6 reaver aircrack-ng rtlsdr-scanner gqrx-sdr wifite pixiewps burpsuite dirb dirbuster gobuster wpscan wordlists sqlmap sqlninja uniscan websploit ffuf siparmyknife powersploit backdoor-factory veil-evasion bettercap beef-xss rtpflood crunch hash-identifier john johnny rainbowcrack hashcat arduino

#init
mkdir server
mkdir /ctf
mkdir /thm
mkdir /htb

#networking
echo "nameserver 1.1.1.1" > /etv/resolv.conf
echo "nameserver 1.0.0.1" >> /etv/resolv.conf

#wireless drivers
apt install -y build-essential libelf-dev linux-headers-`uname -r`
apt install -y realtek-rtl88xxau-dkms
git clone https://github.com/aircrack-ng/rtl8812au.git
cd rtl8812au/
make && make install
cd /opt/

#programming language support
sudo python3 -m pip install --upgrade pip
pip3 install neo4j-driver

#subl
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

#rphp
git clone https://github.com/pentestmonkey/php-reverse-shell.git 
mv php-reverse-shell/php-reverse-shell.php /opt/server/rphp.php
rm -rf php-reverse-shell

#pspy
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy32
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64
mv pspy32 /opt/server/
mv pspy64 /opt/server/

#linenum
wget https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh
mv LinEnum.sh /opt/server/linenum.sh

#kerbrute
wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64
mv kerbrute_linux_amd64 /usr/bin/kerbrute

#rustscan
wget https://github.com/RustScan/RustScan/releases/download/2.0.1/rustscan_2.0.1_amd64.deb
dpkg -i rustscan_2.0.1_amd64.deb
rm -rf /opt/rustscan_2.0.1_amd64.deb

#linpeas
git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git
mkdir peas
mv privilege-escalation-awesome-scripts-suite/* peas/
rm -rf privilege-escalation-awesome-scripts-suite/
cp peas/linPEAS/linpeas.sh /opt/server/
cp peas/winPEAS/winPEASbat/winPEAS.bat /opt/server/

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

#photon
git clone https://github.com/s0md3v/Photon.git

#bloodhound
wget https://github.com/BloodHoundAD/BloodHound/releases/download/4.0.2/BloodHound-linux-x64.zip
unzip BloodHound-linux-x64.zip
rm -rf BloodHound-linux-x64.zip
mkdir bloodhound
mv BloodHound-linux-x64/* bloodhound/
mkdir /usr/share/neo4j/logs
mkdir /usr/share/neo4j/run
#defaul creds - neo4j:neo4j - need to change

#ghidra
wget https://ghidra-sre.org/ghidra_9.2.2_PUBLIC_20201229.zip
unzip ghidra_9.2.2_PUBLIC_20201229.zip
rm -rf ghidra_9.2.2_PUBLIC_20201229.zip
mkdir ghidra
mv ghidra_9.2.2_PUBLIC_20201229/* ghidra/
rm -rf ghidra_9.2.2_PUBLIC_20201229/

#hopper
wget https://d2ap6ypl1xbe4k.cloudfront.net/Hopper-v4-4.7.1-Linux.deb
dpkg -i Hopper-v4-4.7.1-Linux.deb
rm -rf Hopper-v4-4.7.1-Linux.deb

#unicorn
git clone https://github.com/trustedsec/unicorn.git

#urh
git clone https://github.com/jopohl/urh.git

#setting resolution of display
touch screenres.sh
echo 'xrandr --newmode "1920x1080"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync' > screenres.sh
echo 'xrandr --addmode Virtual1 1920x1080' >> screenres.sh
echo 'xrandr --output Virtual1 --mode 1920x1080' >> screenres.sh
chmod +x screenres.sh

#aliases
touch ~/.bash_aliases
echo "alias up='python3 -m http.server 8000'" >> ~/.bash_aliases
echo "alias room='bash /opt/wagames_os/notes/room-box_notes_start.sh'" >> ~/.bash_aliases
echo "alias dirsearch='python3 /opt/dirsearch/dirsearch.py'" >> ~/.bash_aliases
echo "alias ghidra='bash /opt/ghidra/ghidraRun'" >> ~/.bash_aliases
echo "alias photon='python3 /opt/Photon/photon.py'" >> ~/.bash_aliases
echo "alias bloodhound='cd /opt/bloodbound && ./Bloodhound && cd'" >> ~/.bash_aliases
echo "alias screenres='bash /opt/screenres.sh'" >> ~/.bash_aliases

chmod -R 777 /opt/
reboot now
