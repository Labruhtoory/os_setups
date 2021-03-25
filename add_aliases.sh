#!/bin/bash


read -p "Username 4 this box: " uboi

#user aliases
echo "alias up='python3 -m http.server 8000'" >> /home/$uboi/.bashrc
echo "alias room='bash /opt/wagames_os/notes/room-box_notes_start.sh'" >> /home/$uboi/.bashrc
echo "alias dirsearch='python3 /opt/dirsearch/dirsearch.py'" >> /home/$uboi/.bashrc
echo "alias ghidra='bash /opt/ghidra/ghidraRun'" >> /home/$uboi/.bashrc
echo "alias photon='python3 /opt/Photon/photon.py'" >> /home/$uboi/.bashrc
echo "alias bloodhound='cd bash /opt/bloodhound/Bloodhound'" >> /home/$uboi/.bashrc
echo "alias screenres='bash /opt/screenres.sh'" >> /home/$uboi/.bashrc
echo "alias thmvpn='sudo openvpn ~/Desktop/thm.ovpn'" >> /home/$uboi/.bashrc
echo "alias htbvpn='sudo openvpn ~/Desktop/htb.ovpn'" >> /home/$uboi/.bashrc

source /home/$uboi/.bashrc

#root aliases
echo "alias up='python3 -m http.server 8000'" >> /root/.bashrc
echo "alias room='bash /opt/wagames_os/notes/room-box_notes_start.sh'" >> /root/.bashrc
echo "alias dirsearch='python3 /opt/dirsearch/dirsearch.py'" >> /root/.bashrc
echo "alias ghidra='bash /opt/ghidra/ghidraRun'" >> /root/.bashrc
echo "alias photon='python3 /opt/Photon/photon.py'" >> /root/.bashrc
echo "alias bloodhound='cd bash /opt/bloodhound/Bloodhound'" >> /root/.bashrc
echo "alias screenres='bash /opt/screenres.sh'" >> /root/.bashrc
echo "alias thmvpn='sudo openvpn ~/Desktop/thm.ovpn'" >> /root/.bashrc
echo "alias htbvpn='sudo openvpn ~/Desktop/htb.ovpn'" >> /root/.bashrc

source /root/.bashrc

echo DONE!
