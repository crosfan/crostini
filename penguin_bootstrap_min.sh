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
sudo apt install fuse -y
sudo apt install xz-utils -y
sudo apt-get install gnupg2 -y

sudo apt-file update

#VS Code
curl -L https://go.microsoft.com/fwlink/?LinkID=760868 > ~/Downloads/vscode.deb
sudo apt install ~/Downloads/vscode.deb -y

#Firefox
sudo apt install firefox-esr -y

#Chromium
sudo apt install chromium -y

#Upgrade everything
sudo apt update
sudo apt upgrade -y
