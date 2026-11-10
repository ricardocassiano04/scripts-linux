#!/bin/bash
#
# Autor: Ricardo Cassiano
# 
# Configurações iniciais do Linux Mint 22+ / Ubuntu 24.04+
#


### Atualizar os pacotes


echo "Atualizando o repositório e instalando as atualizações."

sleep 2

sudo apt-get update 

sudo apt-get dist-upgrade -y



### Pacotes essenciais


echo "Instalar alguns pacotes essenciais"

sudo apt-get -y install \
vlc \
x265 x264 ffmpeg mpv celluloid \
calibre file-roller \
meld neovim  \
baobab  \
htop dconf-editor yaru-theme-{gtk,icon} \
lynis nmap rkhunter  \
pdftk flameshot qt5ct qt6ct \
adwaita-qt adwaita-qt6 \
shotcut gimp obs-studio \
sox lame twolame strawberry \
git exiftool tmux tilix \
rsync meld webhttrack \
fonts-firacode \
libpam-tmpdir apt-listbugs fail2ban needrestart \
qalculate-gtk libreoffice

### Habilitar firewall

sudo ufw enable


### Configurar tema dos apps qt

echo "Configurando a variável de ambiente QT_QPA_PLATFORMTHEME.
Após reiniciar o sistema, utilize o qt5ct q qt6ct para configurar temas e fontes.
"

sleep 2

tee -a $HOME/.profile>>/dev/null<<EOF

export QT_QPA_PLATFORMTHEME=qt5ct

EOF



### Instalar a última versão do Libreoffice

sudo add-apt-repository ppa:libreoffice/ppa

sudo apt-get update 

sudo apt-get -y dist-upgrade




