#!/bin/bash
#
# Autor: Ricardo Cassiano
#
# Configuração inicial do OpenSUSE Tumbleweed
#
# Essa configuração é a que uso no meu dia-a-dia.
# Fique à vontade para modificar segundos suas necessidades

echo "Script de configuração inicial do OpenSUSE Tumbleweed"


touch $HOME/.alias

echo "alias atualizar='sudo zypper -n dup --allow-vendor-change'" >> $HOME/.alias


sudo systemctl disable {cups,cups-browsed,saned,bluetooth}

sudo systemctl stop {cups,cups-browsed,saned,bluetooth}

sudo zypper addrepo http://download.opensuse.org/repositories/mozilla/openSUSE_Tumbleweed/ Mozilla

sudo zypper addrepo http://download.opensuse.org/repositories/server:/database:/postgresql/openSUSE_Tumbleweed/ PostgreSQL

sudo zypper addrepo http://dl.google.com/linux/chrome/rpm/stable/x86_64 Google-Chrome

sudo rpm --import https://dl.google.com/linux/linux_signing_key.pub

sudo zypper refresh

sudo zypper -n dup --allow-vendor-change

read -r -p "Deseja habilitar o repositório Packman? 1 - SIM 0 - NÃO ": RESPOSTA

if [ "${RESPOSTA}" = 1 ]; then
    sudo zypper -n in opi
    sudo opi codecs
else
    echo "Você escolheu não configurar o repositório Packman. O script vai seguir com os outros pacotes"
fi

sudo zypper -n in google-chrome-stable noto-sans-fonts noto-sans-mono-fonts \
mpv  ubuntu-fonts calibre bibletime gimp  git gitg git-doc \
neovim python3-neovim meld flameshot rclone



