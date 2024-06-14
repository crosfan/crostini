#!/bin/bash
#bash <(curl -s https://raw.githubusercontent.com/crosfan/crostini/master/penguin_bootstrap_min.sh)

#Downloads where we put stuff
cd ~
mkdir -p ~/Downloads
cd ~/Downloads

#Basic utilities
sudo apt install iputils-ping -y
sudo apt install traceroute -y
sudo apt install dnsutils -y
sudo apt install apt-file -y
#sudo apt install fuse -y
#sudo apt install xz-utils -y
#sudo apt install gnupg2 -y

sudo apt-file update

#VS Code
curl -L https://go.microsoft.com/fwlink/?LinkID=760868 > ~/Downloads/vscode.deb
sudo apt install ~/Downloads/vscode.deb -y

#PowerShell
#source /etc/os-release
#curl -L https://packages.microsoft.com/config/debian/$VERSION_ID/packages-microsoft-prod.deb > ~/Downloads/packages-microsoft-prod.deb
#sudo dpkg -i packages-microsoft-prod.deb
#rm packages-microsoft-prod.deb
#sudo apt update
#sudo apt install powershell -y

#Firefox
sudo apt install firefox-esr -y

#Chromium
sudo apt install chromium -y

#Webex Teams
mkdir -p ~/.local/share
curl -L https://binaries.webex.com/WebexDesktop-Ubuntu-Official-Package/Webex.deb > ~/Downloads/Webex.deb
sudo apt install ~/Downloads/Webex.deb -y

#Upgrade everything
sudo apt update
sudo apt upgrade -y
