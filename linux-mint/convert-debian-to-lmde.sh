#!/bin/bash
#
# Autor: Ricardo Cassiano
# 
# Script para converter Debian 13 (Trixie) para o Linux Mint Debian Edition 7 (Gigi)
#



### Instalar as atualizações


echo "Atualizando o repositório e instalando as atualizações."

sleep 2

sudo apt-get update 

sudo apt-get dist-upgrade -y

### Adicionar repositório do Linux Mint Debian Edition (LMDE) Gigi

sudo tee -a /etc/apt/sources.list.d/lmde.list>>/dev/null<<EOF

deb http://packages.linuxmint.com/ gigi main upstream import backport

EOF


sudo apt-get -y install wget

wget -c http://packages.linuxmint.com/pool/main/l/linuxmint-keyring/linuxmint-keyring_2022.06.21_all.deb

sudo dpkg -i  linuxmint-keyring_2022.06.21_all.deb

sudo apt-get update 

sudo apt-get dist-upgrade -y


### Instalando os pacotes do Linux Mint (LMDE) Gigi

sudo apt-get -y install tint2

sudo apt-get -y install mint-{info,meta}-cinnamon bulky sticky gnome-{terminal,screenshot,system-monitor} \
xed xreader xviewer pix nemo-fileroller gnome-calculator celluloid mint-meta-codecs


echo "Agora reinicie o sistema e escolha o Linux Mint no gerenciador de login!"