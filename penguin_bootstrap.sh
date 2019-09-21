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
sudo apt install fuse -y
sudo apt-file update

#VS Code
curl -L https://go.microsoft.com/fwlink/?LinkID=760868 > ~/Downloads/vscode.deb
sudo apt install ~/Downloads/vscode.deb -y
sudo cp /usr/share/applications/code.desktop /usr/share/applications/code.desktop.orig
sudo sed -i 's/Exec=\/usr\/share\/code\/code --unity-launch %F/Exec=sommelier -X --scale=0.8 --dpi=160 \/usr\/share\/code\/code "--unity-launch %F"/g' /usr/share/applications/code.desktop
sudo sed -i 's/Exec=\/usr\/share\/code\/code --new-window %F/Exec=sommelier -X --scale=0.8 --dpi=160 \/usr\/share\/code\/code "--new-window %F"/g' /usr/share/applications/code.desktop

#Firefox
sudo apt install firefox-esr -y
sudo cp /usr/share/applications/firefox-esr.desktop /usr/share/applications/firefox-esr.desktop.orig
sudo sed -i 's/Exec=\/usr\/lib\/firefox-esr\/firefox-esr %u/Exec=sommelier -X --scale=0.45 --dpi=160 \/usr\/lib\/firefox-esr\/firefox-esr %u/g' /usr/share/applications/firefox-esr.desktop

#Chromium
sudo apt install chromium -y

#Apache
sudo apt install apache2 -y

#PHP Modules
sudo apt install php7.0 libapache2-mod-php7.0 php7.0-cli php7.0-mcrypt php7.0-intl php7.0-mysql php7.0-curl php7.0-gd php7.0-soap php7.0-xml php7.0-zip -y
sudo cp /etc/php/7.0/apache2/php.ini /etc/php/7.0/apache2/php.ini.orig
sudo sed -i 's/;date.timezone =/date.timezone = UTC/g' /etc/php/7.0/apache2/php.ini
sudo sed -i 's/memory_limit = 128M/memory_limit = 512M/g' /etc/php/7.0/apache2/php.ini
sudo sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php/7.0/apache2/php.ini
sudo sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 100M/g' /etc/php/7.0/apache2/php.ini
sudo sed -i 's/post_max_size = 8M/post_max_size = 100M/g' /etc/php/7.0/apache2/php.ini

#MariaDb
# sudo apt install mariadb-server -y
# sudo mysql_secure_installation #Need to just script out the necessary commands that this script executes here instead of calling this
# sudo mysql -u root -p #Need to automate this as well
# CREATE DATABASE drupaldb;
# GRANT ALL PRIVILEGES on drupaldb.* to 'drupal'@'localhost' identified by 'password';
# FLUSH PRIVILEGES;
# \q

# Drupal install
# curl -L https://www.drupal.org/download-latest/tar.gz > ~/Downloads/drupal.tar.gz
# tar xzf ~/Downloads/drupal.tar.gz
# sudo mv ~/Downloads/drupal-8.7.7/ /var/www/html/drupal
# sudo chown -R root:root /var/www/html/drupal
# Grab drupal virtual host file


#Upgrade everything
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y

#Reboot (keymappings don't work till reboot, sudo reboot not working, use shutdown then open terminal)
sudo shutdown -h now
