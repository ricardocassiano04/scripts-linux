#!/bin/bash
#
# Instala ou atualiza os temas do Linux Mint 
# direto do Github
#


sudo apt-get -y install sassc pysassc git 


git clone https://github.com/linuxmint/mint-themes.git

git clone https://github.com/linuxmint/mint-y-icons.git


cd mint-themes/

python3 generate-themes.py

sudo cp -rf usr/share/themes/Mint-* /usr/share/themes/

sudo chmod -R 755 /usr/share/themes/Mint-*

sudo cp -rf ../mint-y-icons/usr/share/icons/Mint* /usr/share/icons/

sudo chmod -R 755 /usr/share/icons/Mint-*

find /usr/share/icons/ -iname "Mint-*" -type d -exec sudo gtk-update-icon-cache -f -t {} \;


echo "Temas do Linux Mint instalado"






