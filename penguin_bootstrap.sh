#!/bin/bash
#bash <(curl -s https://raw.githubusercontent.com/crosfan/crostini/master/penguin_bootstrap.sh)
#Fix container time
sudo ln -fs /usr/share/zoneinfo/US/Central /etc/localtime 
sudo dpkg-reconfigure -f noninteractive tzdata

#Set ChromeOS Key Shortcuts in Crostini
sudo cp /etc/systemd/user/sommelier@0.service.d/cros-sommelier-override.conf /etc/systemd/user/sommelier@0.service.d/cros-sommelier-override.conf.orig
sudo sed -i 's/Environment="SOMMELIER_ACCELERATORS=Super_L"/Environment="SOMMELIER_ACCELERATORS=Super_L,<Alt>bracketright,<Alt>bracketleft,<Alt>equal"/g' /etc/systemd/user/sommelier@0.service.d/cros-sommelier-override.conf
sudo cp /etc/systemd/user/sommelier-x@0.service.d/cros-sommelier-x-override.conf /etc/systemd/user/sommelier-x@0.service.d/cros-sommelier-x-override.conf.orig
sudo sed -i 's/Environment="SOMMELIER_ACCELERATORS=Super_L"/Environment="SOMMELIER_ACCELERATORS=Super_L,<Alt>bracketright,<Alt>bracketleft,<Alt>equal"/g' /etc/systemd/user/sommelier-x@0.service.d/cros-sommelier-x-override.conf

#Downloads where we put stuff
cd ~
mkdir ~/Downloads

#Basic utilities
sudo apt install iputils-ping -y
sudo apt install apt-file -y
sudo apt-file update

#VS Code
curl -L https://go.microsoft.com/fwlink/?LinkID=760868 > ~/Downloads/vscode.deb
sudo apt install ~/Downloads/vscode.deb -y
sudo cp /usr/share/applications/code.desktop /usr/share/applications/code.desktop.orig
sudo sed -i 's/Exec=\/usr\/share\/code\/code --unity-launch %F/Exec=sommelier -X --scale=0.8 --dpi=160 \/usr\/share\/code\/code "--unity-launch %F"/g' /usr/share/applications/code.desktop
sudo sed -i 's/Exec=\/usr\/share\/code\/code --new-window %F/Exec=sommelier -X --scale=0.8 --dpi=160 \/usr\/share\/code\/code "--new-window %F"/g' /usr/share/applications/code.desktop

#NODE.JS
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt install nodejs -y 
# sudo apt-get install build-essential -y 

#HelloCrostini.js
cd ~
mkdir ~/Node
curl -s https://raw.githubusercontent.com/crosfan/crostini/master/Node/HelloCrostini.js > ~/Node/HelloCrostini.js
node ~/Node/HelloCrostini.js &
sleep 1
x-www-browser http://penguin.linux.test:8080


#Atom
#curl -L https://atom.io/download/deb > ~/Downloads/atom.deb
#sudo apt install ~/Downloads/atom.deb -y

#Firefox
sudo apt install firefox-esr -y
sudo cp /usr/share/applications/firefox-esr.desktop /usr/share/applications/firefox-esr.desktop.orig
sudo sed -i 's/Exec=\/usr\/lib\/firefox-esr\/firefox-esr %u/Exec=sommelier -X --scale=0.45 --dpi=160 \/usr\/lib\/firefox-esr\/firefox-esr %u/g' /usr/share/applications/firefox-esr.desktop

#Chromium
sudo apt install chromium -y

#Discord App
curl -L "https://discordapp.com/api/download?platform=linux&format=deb" > ~/Downloads/discord.deb
sudo apt install ~/Downloads/discord.deb -y
sudo cp /usr/share/applications/discord.desktop /usr/share/applications/discord.desktop.orig
sudo sed -i 's/Exec=\/usr\/share\/discord\/Discord/Exec=sommelier -X --scale=0.8 --dpi=160 \/usr\/share\/discord\/Discord/g' /usr/share/applications/discord.desktop

#gpu testing stuff
sudo apt install supertuxkart -y
sudo apt install mesa-utils -y

#Upgrade everything
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y

#Reboot (keymappings don't work till reboot)
sudo reboot
