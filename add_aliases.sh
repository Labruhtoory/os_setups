#!/bin/bash

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

sudo su

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

echo DONE!
