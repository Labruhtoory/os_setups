#!/bin/bash

echo 'adding apt repo'
#repo
echo "" > /etc/apt/sources.list
apt-key adv --keyserver pool.sks-keyservers.net --recv-keys ED444FF07D8D0BF6
echo '# Kali linux repositories | Added by Katoolin' >> /etc/apt/sources.list
echo 'deb http://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list
apt-get update

echo 'moving to /opt'
#init
cd /opt
mkdir server
mkdir /ctf
mkdir /thm
mkdir /htb

#networking
echo "nameserver 1.1.1.1" > /etc/resolv.conf
echo "nameserver 1.0.0.1" >> /etc/resolv.conf

#setting resolution of display
touch screenres.sh
echo 'xrandr --newmode "1920x1080"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync' > screenres.sh
echo 'xrandr --addmode Virtual1 1920x1080' >> screenres.sh
echo 'xrandr --output Virtual1 --mode 1920x1080' >> screenres.sh
chmod +x screenres.sh

echo 'keep in mind the default answer is yes...'
read -p 'Full? y/n> ' full
if [ $(full) == 'n' ] 
then
  sudo apt install -fy python3 python3-pip sqlitebrowser golang nasm default-jdk terminator
  sudo apt --fix-broken install
  #programming language support
  sudo python3 -m pip install --upgrade pip
  pip3 install neo4j-driver

  echo "OK, Please choose you packages (y/n)..."
  read -p 'Net?> ' net
  read -p 'Recon?> ' recon
  read -p 'Enum?> ' enum
  read -p 'revfor?> ' revfor
  read -p 'Xploit?> ' xploit
  read -p 'Post?> ' post
  read -p 'Anon?> ' anon
  if [ $(net) == 'n' ]
  then
  echo 'No net...'
  else
  sudo apt install -fy nmap masscan wireshark aircrack-ng wifite pixiewps bettercap clusterssh netdiscover reaver rtpflood
  sudo apt --fix-broken install
  
  #Responder
  https://github.com/SpiderLabs/Responder.git
  
  #evil limiter
  git clone https://github.com/bitbrute/evillimiter.git
  
  fi
  if [ $(recon) == 'n' ]
  then
  echo 'No recon...'
  else
  sudo apt install -fy recon-ng aircrack-ng rtlsdr-scanner gqrx-sdr osrframework legion dnsrecon thc-ipv6 uniscan ffuf
  sudo apt --fix-broken install								
  
  #rustscan
  wget https://github.com/RustScan/RustScan/releases/download/2.0.1/rustscan_2.0.1_amd64.deb
  dpkg -i rustscan_2.0.1_amd64.deb
  rm -rf /opt/rustscan_2.0.1_amd64.deb

  #unicorn
  git clone https://github.com/trustedsec/unicorn.git

  #urh
  git clone https://github.com/jopohl/urh.git

  #phoninfoga
  curl -sSL https://raw.githubusercontent.com/sundowndev/PhoneInfoga/master/support/scripts/install | bash
  mv ./phoneinfoga /usr/bin/phoneinfoga

  #photon
  git clone https://github.com/s0md3v/Photon.git
  
  #goscan
  wget https://github.com/marco-lancini/goscan/releases/download/v2.4/goscan_2.4_linux_amd64.zip
  unzip goscan_2.4_linux_amd64.zip
  rm -rf goscan_2.4_linux_amd64.zip
  mv ./goscan /bin/goscan
  
  fi
  if [ $(enum) == 'n' ]
  then
  echo 'No enum...'
  else
  sudo apt install -fy nikto voiphopper zaproxy burpsuite enum4linux dmitry dnstracer dirb dirbuster gobuster wpscan siparmyknife theharvester
  sudo apt --fix-broken install
  
  #linenum
  wget https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh
  mv LinEnum.sh /opt/server/linenum.sh

  #kerbrute
  wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64
  mv kerbrute_linux_amd64 /usr/bin/kerbrute

  #linpeas
  git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git
  mkdir peas
  mv privilege-escalation-awesome-scripts-suite/* peas/
  rm -rf privilege-escalation-awesome-scripts-suite/
  cp peas/linPEAS/linpeas.sh /opt/server/
  cp peas/winPEAS/winPEASbat/winPEAS.bat /opt/server/

  #dirsearch
  git clone https://github.com/maurosoria/dirsearch.git
  fi
  if [ $(revfor) == 'n' ]
  then
  echo 'No revfor...'
  else
  sudo apt install -fy exiftool binwalk radare2 gdb audacity arduino
  sudo apt --fix-broken install
  
  #vscode
  sudo apt update
  sudo apt install software-properties-common apt-transport-https wget
  wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
  sudo apt install code

  #hopper
  wget https://d2ap6ypl1xbe4k.cloudfront.net/Hopper-v4-4.7.1-Linux.deb
  dpkg -i Hopper-v4-4.7.1-Linux.deb
  rm -rf Hopper-v4-4.7.1-Linux.deb

  #ghidra
  wget https://ghidra-sre.org/ghidra_9.2.2_PUBLIC_20201229.zip
  unzip ghidra_9.2.2_PUBLIC_20201229.zip
  rm -rf ghidra_9.2.2_PUBLIC_20201229.zip
  mkdir ghidra
  mv ghidra_9.2.2_PUBLIC/* ghidra/
  rm -rf ghidra_9.2.2_PUBLIC/

  #ILSpy decompiler
  git clone https://github.com/icsharpcode/ILSpy.git
  fi
  if [ $(xploit) == 'n' ]
  then
  echo 'No xploit...'
  else
  sudo apt install -fy exploitdb set sqlmap sqlninja websploit powersploit veil-evasion beef-xss

  #rphp
  git clone https://github.com/pentestmonkey/php-reverse-shell.git 
  mv php-reverse-shell/php-reverse-shell.php /opt/server/rphp.php
  rm -rf php-reverse-shell

  #pspy
  wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy32
  wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64
  mv pspy32 /opt/server/
  mv pspy64 /opt/server/

  #PSEmpire
  git clone https://github.com/EmpireProject/Empire.git
  fi
  if [ $(post) == 'n' ]
  then
  echo 'No post...'
  else
  sudo apt install -fy neo4j wordlists backdoor-factory crunch hash-identifier john johnny rainbowcrack hashcat
  sudo apt --fix-broken install
  
  #bloodhound
  wget https://github.com/BloodHoundAD/BloodHound/releases/download/4.0.2/BloodHound-linux-x64.zip
  unzip BloodHound-linux-x64.zip
  rm -rf BloodHound-linux-x64.zip
  mkdir bloodhound
  mv BloodHound-linux-x64/* bloodhound/
  rm -rf BloodHound-linux-x64/
  mkdir /usr/share/neo4j/logs
  mkdir /usr/share/neo4j/run
  #defaul creds - neo4j:neo4j - need to change
  
  #SecLists
  git clone https://github.com/danielmiessler/SecLists.git
  
  fi
  if [ $(anon) == 'n' ]
  then
  echo 'No anon...'
  else
  sudo apt install -fy openvpn tor torbrowser-launcher
  sudo apt --fix-broken install
  fi
  if [ $(cus) == 'n' ]
  then
  echo 'No custom...'
  else
  sudo apt install -fy gnome-tweaks
  sudo apt --fix-broken install
  
  #subl
  wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
  sudo apt-get install apt-transport-https
  echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
  sudo apt-get update
  sudo apt-get install sublime-text								

  #poor mans pentest
  git clone https://github.com/JohnHammond/poor-mans-pentest.git
  mkdir pmp
  mv poor-mans-pentest/* pmp/
  rm -rf poor-mans-pentest
  
  #cherrytree
  sudo apt install -y cherrytree
  fi
else
  echo "OK, installing all packages"
  
  #initial stuff
  sudo apt install -fy kali-menu python3 python3-pip sqlitebrowser golang nasm default-jdk terminator
  sudo apt --fix-broken install
  #programming language support
  sudo python3 -m pip install --upgrade 
  
  sudo apt install -fy wireshark python3 python3-pip sqlitebrowser golang terminator openvpn gnome-tweaks exiftool nasm binwalk default-jdk radare2 gdb gqrx-sdr clusterssh audacity neo4j tor torbrowser-launcher nmap masscan exploitdb armitage set nikto osrframework recon-ng netdiscover legion voiphopper zaproxy enum4linux dmitry dnsrecon dnstracer theharvester thc-ipv6 reaver aircrack-ng rtlsdr-scanner gqrx-sdr wifite pixiewps burpsuite dirb dirbuster gobuster wpscan wordlists sqlmap sqlninja uniscan websploit ffuf siparmyknife powersploit backdoor-factory veil-evasion bettercap beef-xss rtpflood crunch hash-identifier john johnny rainbowcrack hashcat arduino
  sudo apt --fix-broken install
  
  
  
  #goscan
  wget https://github.com/marco-lancini/goscan/releases/download/v2.4/goscan_2.4_linux_amd64.zip
  unzip goscan_2.4_linux_amd64.zip
  rm -rf goscan_2.4_linux_amd64.zip
  mv ./goscan /bin/goscan
  
  #Responder
  https://github.com/SpiderLabs/Responder.git
  
  #unicorn
  git clone https://github.com/trustedsec/unicorn.git

  #urh
  git clone https://github.com/jopohl/urh.git
    
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
  git clone https://github.com/JohnHammond/poor-mans-pentest.git
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

  #hopper
  wget https://d2ap6ypl1xbe4k.cloudfront.net/Hopper-v4-4.7.1-Linux.deb
  dpkg -i Hopper-v4-4.7.1-Linux.deb
  rm -rf Hopper-v4-4.7.1-Linux.deb
    
  #subl
  wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
  sudo apt-get install apt-transport-https
  echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
  sudo apt-get update
  sudo apt-get install sublime-text
  
  
  #vscode
  sudo apt update
  sudo apt install software-properties-common apt-transport-https wget
  wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
  sudo apt install code
    
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
    
  #bloodhound
  wget https://github.com/BloodHoundAD/BloodHound/releases/download/4.0.2/BloodHound-linux-x64.zip
  unzip BloodHound-linux-x64.zip
  rm -rf BloodHound-linux-x64.zip
  mkdir bloodhound
  mv BloodHound-linux-x64/* bloodhound/
  mkdir /usr/share/neo4j/logs
  mkdir /usr/share/neo4j/run
  #defaul creds - neo4j:neo4j - need to change
  
  #SecLists
  git clone https://github.com/danielmiessler/SecLists.git

  #ghidra
  wget https://ghidra-sre.org/ghidra_9.2.2_PUBLIC_20201229.zip
  unzip ghidra_9.2.2_PUBLIC_20201229.zip
  rm -rf ghidra_9.2.2_PUBLIC_20201229.zip
  mkdir ghidra
  mv ghidra_9.2.2_PUBLIC/* ghidra/
  rm -rf ghidra_9.2.2_PUBLIC/
  
  #evil limiter
  git clone https://github.com/bitbrute/evillimiter.git
fi

#wireless drivers
apt install -y build-essential libelf-dev linux-headers-`uname -r`
apt install -y realtek-rtl88xxau-dkms
git clone https://github.com/aircrack-ng/rtl8812au.git
cd rtl8812au/
make && make install
cd /opt/
    
#user aliases
echo "alias up='python3 -m http.server 8000'" >> ~/.bashrc
echo "alias room='bash /opt/wagames_os/notes/room-box_notes_start.sh'" >> ~/.bashrc
echo "alias dirsearch='python3 /opt/dirsearch/dirsearch.py'" >> ~/.bashrc
echo "alias ghidra='bash /opt/ghidra/ghidraRun'" >> ~/.bashrc
echo "alias photon='python3 /opt/Photon/photon.py'" >> ~/.bashrc
echo "alias bloodhound='cd bash /opt/bloodhound/Bloodhound'" >> ~/.bashrc
echo "alias screenres='bash /opt/screenres.sh'" >> ~/.bashrc
echo "alias thmvpn='sudo openvpn ~/Desktop/thm.ovpn'" >> ~/.bashrc
echo "alias htbvpn='sudo openvpn ~/Desktop/htb.ovpn'" >> ~/.bashrc

#root aliases
echo "alias up='python3 -m http.server 8000'" >> /root/.bashrc
echo "alias room='bash /opt/wagames_os/notes/room-box_notes_start.sh'" >> /root/.bashrc
echo "alias dirsearch='python3 /opt/dirsearch/dirsearch.py'" >> /root/.bashrc
echo "alias ghidra='bash /opt/ghidra/ghidraRun'" >> /root/.bashrc
echo "alias photon='python3 /opt/Photon/photon.py'" >> /root/.bashrc
echo "alias bloodhound='cd bash /opt/bloodhound/Bloodhound'" >> /root/.bashrc
echo "alias screenres='bash /opt/screenres.sh'" >> /root/.bashrc
echo "alias thmvpn='sudo openvpn ~/Desktop/thm.ovpn'" >> ~/.bashrc
echo "alias htbvpn='sudo openvpn ~/Desktop/htb.ovpn'" >> ~/.bashrc

chmod -R 777 /opt/
reboot now
