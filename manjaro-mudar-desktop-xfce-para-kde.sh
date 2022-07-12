#!/bin/bash
#
# Autor: Ricardo Cassiano
# E-mail: rc.cassiano04@gmail.com
# Github: https://github.com/ricardocassiano04
#
# Script para mudar o Ambiente de desktop do Xfce 
# para o Kde no Manjaro Linux.
#
# 12/07/2022


INSTALAR_PACOTE="sudo pacman -S --noconfirm --needed"
REMOVER_PACOTE="sudo pacman -Rcns --noconfirm"

# Desabilitar as configurações de aparência dos aplicativos qt
# no Xfce

mv $HOME/.config/qt5ct $HOME/.config/qt5ct.bak

mv $HOME/.config/Kvantum $HOME/.config/Kvantum.bak

sudo sed -i 's/export QT_QPA/#export QT_QPA/g' /etc/environment

# Remover qt5ct e kvantum

$REMOVER_PACOTE qt5ct kvantum


# Instalar o Kde com alguns pacotes extras

$INSTALAR_PACOTE kf5 plasma parley sddm kapman ksudoku kajongg kbreakout \
gwenview kcolorchooser svgpart kdegraphics-thumbnailers kolourpaint \
okular spectacle k3b elisa juk dragon ffmpegthumbs kwave falkon \
kget konqueror ktorrent krdc dolphin dolphin-plugins kcron  partitionmanager \
khelpcenter ark filelight kbackup kcharselect kdialog kfind \
kate kcalc konsole kwalletmanager kwrite print-manager \
markdownpart sweeper kdevelop sddm-breath-theme kompare \

# Habilitar o gerenciador de login SDDM

sudo systemctl enable sddm.service -f

$REMOVER_PACOTE xfce4 xfce4-goodies catfish viewnior lightdm \
lightdm-gtk-greeter-settings

sudo reboot
















