#!/bin/bash
#bash <(curl -s https://raw.githubusercontent.com/crosfan/crostini/master/penguin_bootstrap.sh)
#Fix container time
sudo ln -fs /usr/share/zoneinfo/US/Central /etc/localtime 
sudo dpkg-reconfigure -f noninteractive tzdata

#Set ChromeOS Key Shortcuts in Crostini
#echo "echo Xft.dpi: 192 | xrdb -merge 
#export GDK_SCALE=2 
#export GDK_SCALE_DPI=192 
#export SOMMELIER_SCALE=1
#export SOMMELIER_ACCELERATORS=\"<Alt>Bracketright,<Alt>Bracketleft\"
#echo \"SOMMELIER_WAS_HERE\" `date` >> som.log
#" > ~/.sommelierrc
#systemctl --user daemon-reload
#systemctl --user restart sommelier@0.service
#systemctl --user restart sommelier-x@0.service

#Downloads where we put stuff
cd ~
mkdir -p ~/Downloads

#Basic utilities
sudo apt install iputils-ping -y
sudo apt install apt-file -y
sudo apt install fuse
sudo apt-file update

#VS Code
curl -L https://go.microsoft.com/fwlink/?LinkID=760868 > ~/Downloads/vscode.deb
sudo apt install ~/Downloads/vscode.deb -y
#sudo cp /usr/share/applications/code.desktop /usr/share/applications/code.desktop.orig
#sudo sed -i 's/Exec=\/usr\/share\/code\/code --unity-launch %F/Exec=sommelier -X --scale=0.8 --dpi=160 \/usr\/share\/code\/code "--unity-launch %F"/g' /usr/share/applications/code.desktop
#sudo sed -i 's/Exec=\/usr\/share\/code\/code --new-window %F/Exec=sommelier -X --scale=0.8 --dpi=160 \/usr\/share\/code\/code "--new-window %F"/g' /usr/share/applications/code.desktop

#NODE.JS
#curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
#sudo apt install nodejs -y 
# sudo apt-get install build-essential -y 

#HelloCrostini.js
#cd ~
#mkdir ~/Node
#curl -s https://raw.githubusercontent.com/crosfan/crostini/master/Node/HelloCrostini.js > ~/Node/HelloCrostini.js
#node ~/Node/HelloCrostini.js &
#sleep 1
#x-www-browser http://penguin.linux.test:8080


#Atom
#curl -L https://atom.io/download/deb > ~/Downloads/atom.deb
#sudo apt install ~/Downloads/atom.deb -y

#Firefox
sudo apt install firefox-esr -y
#sudo cp /usr/share/applications/firefox-esr.desktop /usr/share/applications/firefox-esr.desktop.orig
#sudo sed -i 's/Exec=\/usr\/lib\/firefox-esr\/firefox-esr %u/Exec=sommelier -X --scale=0.45 --dpi=160 \/usr\/lib\/firefox-esr\/firefox-esr %u/g' /usr/share/applications/firefox-esr.desktop

#Chromium
#sudo apt install chromium -y

#Discord App
#curl -L "https://discordapp.com/api/download?platform=linux&format=deb" > ~/Downloads/discord.deb
#sudo apt install ~/Downloads/discord.deb -y
#sudo cp /usr/share/applications/discord.desktop /usr/share/applications/discord.desktop.orig
#sudo sed -i 's/Exec=\/usr\/share\/discord\/Discord/Exec=sommelier -X --scale=0.8 --dpi=160 \/usr\/share\/discord\/Discord/g' /usr/share/applications/discord.desktop

#gpu testing stuff
#sudo apt install supertuxkart -y
#sudo apt install mesa-utils -y

#Joplin notes
#curl -L https://raw.githubusercontent.com/laurent22/joplin/master/Joplin_install_and_update.sh | bash
#mkdir -p ~/.local/share/applications
#echo -e "[Desktop Entry]\nEncoding=UTF-8\nName=Joplin\nComment=Joplin for Desktop\nExec=/home/$USER/.joplin/Joplin.AppImage\nIcon=joplin\nStartupWMClass=Joplin\nType=Application\nCategories=Application > ~/.local/share/applications/joplin.desktop


#Upgrade everything
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y

#Reboot (keymappings don't work till reboot, sudo reboot not working, use shutdown then open terminal)
sudo shutdown -h now
