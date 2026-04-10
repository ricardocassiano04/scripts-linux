#!/bin/bash
#
# Autor: Ricardo Cassiano
# 
# Configurações iniciais do Linux Fedora
#



# Verificar a distribuição

source /etc/os-release

if [[ "$ID" != "fedora"  ]]; then   
   echo "Sua distro $PRETTY_NAME não é suportada. Saindo..."
   exit 0
   
elif [[ "$ID" == "fedora"  ]]; then
	versao=${VERSION_ID%%.*}
	
	if ((  versao < 42 )); then
		echo "Sua distro $PRETTY_NAME não é suportada por este script. Saindo..."
		exit 0
	elif (( versao > 41 )); then		
		echo "Sua distro $PRETTY_NAME é suportada. Iniciando a instalação..."
	fi
fi



sleep 1


### Configurar repositórios rpmfucion e instalar atualizações do sistema
# https://rpmfusion.org/

echo "Instalar os repositórios do RPM Fusion, conforme comandos do site https://rpmfusion.org/."


sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1


echo "Instalando as atualizações e alguns pacotes essenciais"

sudo dnf update -y

sudo dnf -y install langpacks-core-pt_BR langpacks-pt_BR \
glibc-langpack-pt libreoffice libreoffice-langpack-pt-BR \
vlc tmux neovim x265 sox lame twolame gimp \
meld geany flameshot rclone rsync lynis calibre






echo "Finalizado!!!"

