#!/bin/bash
#
# Autor: Ricardo Cassiano
#
# Configuração inicial do OpenSUSE Leap
#
# Essa configuração é a que uso no meu dia-a-dia.
# Fique à vontade para modificar segundos suas necessidades


touch $HOME/.alias

echo "alias atualizar='sudo zypper -n dup --allow-vendor-change'" >> $HOME/.alias


sudo systemctl disable {cups,cups-browsed,saned,bluetooth}

sudo systemctl stop {cups,cups-browsed,saned,bluetooth}

sudo zypper addrepo http://download.opensuse.org/repositories/mozilla/openSUSE_Leap_15.6/ Mozilla

sudo zypper addrepo http://download.opensuse.org/repositories/server:/database:/postgresql/15.6/ PostgreSQL

sudo zypper addrepo http://dl.google.com/linux/chrome/rpm/stable/x86_64 Google-Chrome

sudo rpm --import https://dl.google.com/linux/linux_signing_key.pub

sudo zypper refresh

sudo zypper -n dup --allow-vendor-change

sudo zypper -n in opi

sudo opi codecs

sudo zypper -n in google-chrome-stable noto-sans-fonts noto-sans-mono-fonts \
mpv  ubuntu-fonts bibletime gimp  git gitg git-doc \
neovim python3-neovim meld flameshot tmux tilix


# Eclipse Temurin JDK
# Instruções do link oficial https://adoptium.net/installation/linux/


# Adiciona o repositório 
zypper ar -f https://packages.adoptium.net/artifactory/rpm/opensuse/$(. /etc/os-release; echo $VERSION_ID)/$(uname -m) adoptium


read -r -p "Digite a versão desejada  (exemplo: 8, 11, 17 , 21): " VERSAO

zypper install temurin-"${VERSAO}"-jdk


