#!/bin/bash
#Fix container time
sudo ln -fs /usr/share/zoneinfo/US/Central /etc/localtime 
sudo dpkg-reconfigure -f noninteractive tzdata

#Where we put stuff
cd ~
mkdir ~/Downloads

#Core Stuff
sudo apt install iputils-ping -y
sudo apt install apt-file -y
sudo apt-file update

#VS Code
curl -L https://go.microsoft.com/fwlink/?LinkID=760868 > ~/Downloads/vscode.deb
sudo apt install ~/Downloads/vscode.deb -y
sudo cp /usr/share/applications/code.desktop /usr/share/applications/code.desktop.orig
sudo sed -i 's/Exec=\/usr\/share\/code\/code --unity-launch %F/Exec=sommelier -X --scale=0.8 --dpi=160 \/usr\/share\/code\/code "--unity-launch %F"/g' /usr/share/applications/code.desktop
sudo sed -i 's/Exec=\/usr\/share\/code\/code --new-window %F/Exec=sommelier -X --scale=0.8 --dpi=160 Exec=\/usr\/share\/code\/code "--new-window %F"/g' /usr/share/applications/code.desktop

#NODE.JS
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt install nodejs -y 
# sudo apt-get install build-essential -y 

#HelloCrostini.js
cd ~
mkdir ~/Node
echo "// Load the http module to create an http server.
var http = require('http');

// Configure our HTTP server to respond with Hello World to all requests.
var server = http.createServer(function (request, response) {
  response.writeHead(200, {\"Content-Type\": \"text/plain\"});
  response.end(\"Hello World Crostini\n\" + new Date().toDateString()+ \"\n\" + new Date().toLocaleTimeString());
});

// Listen on port 8000, IP defaults to 127.0.0.1
server.listen(8080);

// Put a friendly message on the terminal
console.log(\"Server running at http://penguin.linux.test:8080/\");" > ~/Node/HelloCrostini.js

#Launch
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
sudo sed -i 's/Exec=\/usr\/share\/discord\/Discord/Exec=sommelier -X --scale=0.8 --dpi=160 \/usr\/share\/discord\/Discord/g' /usr/share/applications/discord.desktop

Exec=/usr/share/discord/Discord


#gPU Stuff
#sudo apt install supertuxkart -y
sudo apt install mesa-utils -y

# Upgrade everything
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y

