#!/bin/bash
#
# Script para configurar o repositório do Virtualbox No debian 13
#
# Referência: https://www.virtualbox.org/wiki/Linux_Downloads

 
sudo tee -a /etc/apt/sources.list.d/virtualbox.list>>/dev/null<<EOF

deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian trixie contrib

EOF



wget -c https://www.virtualbox.org/download/oracle_vbox_2016.asc

sudo gpg --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg --dearmor oracle_vbox_2016.asc

sudo apt-get update 

sudo apt-get install virtualbox-7.2
