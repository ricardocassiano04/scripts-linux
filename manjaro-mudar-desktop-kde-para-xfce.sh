#!/bin/bash
#
# Autor: Ricardo Cassiano
# E-mail: rc.cassiano04@gmail.com
# Github: https://github.com/ricardocassiano04
#
# Script para mudar o Ambiente de desktop do Kde
# para o Xfce no Manjaro Linux.
#
# 12/07/2022


INSTALAR_PACOTE="sudo pacman -S --noconfirm --needed"
REMOVER_PACOTE="sudo pacman -Rcns --noconfirm"

# Desabilitar as configurações de aparência dos aplicativos qt
# no Xfce

mv $HOME/.config/qt5ct.bak $HOME/.config/qt5ct

mv $HOME/.config/Kvantum.bak $HOME/.config/Kvantum

sudo sed -i 's/#export QT_QPA/export QT_QPA/g' /etc/environment

# Remover qt5ct e kvantum

$INSTALAR_PACOTE qt5ct kvantum xfce4 xfce4-goodies catfish viewnior lightdm \
lightdm-gtk-greeter-settings evince file-roller


$REMOVER_PACOTE kf5 plasma sddm kde-applications

rm -rf .gtkrc*  

rm -rf .config/gtk-4.0/*.ini

rm -rf .config/gtk-3.0/*.{ini,css}


# Habilitar o gerenciador de login SDDM

sudo systemctl enable lightdm.service -f


#sudo reboot
















