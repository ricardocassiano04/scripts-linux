#!/bin/bash
#
# Autor: Ricardo Cassiano
#
# Configuração inicial do OpenSUSE Leap 16
#
# Essa configuração é a que uso no meu dia-a-dia.
# Fique à vontade para modificar segundos suas necessidades


# Cria um alias chamado atualizar para upgrade dos pacotes

touch $HOME/.alias

echo "alias atualizar='sudo zypper dup --allow-vendor-change'" >> $HOME/.alias

# Adiciona repositórios da Mozilla, do Google Chrome e do PostgreSQL

sudo rpm --import https://packages.mozilla.org/rpm/firefox/signing-key.gpg
sudo zypper ar --gpgcheck-allow-unsigned-repo -p 10 https://packages.mozilla.org/rpm/firefox mozilla
sudo zypper refresh

# Remover versão antiga do Firefox e instalar a nova

sudo zypper -n remove MozillaFirefox MozillaFirefox*

sudo zypper -n install firefox


sudo zypper addrepo http://download.opensuse.org/repositories/server:/database:/postgresql/16.0/ PostgreSQL

sudo zypper addrepo http://dl.google.com/linux/chrome/rpm/stable/x86_64 Google-Chrome


sudo rpm --import https://dl.google.com/linux/linux_signing_key.pub

sudo zypper addrepo https://download.opensuse.org/repositories/LibreOffice:/Factory/openSUSE_Leap_16.0/ Libreoffice


sudo zypper ar https://download.videolan.org/SuSE/16.0 VLC
sudo zypper mr -r VLC

# Atualiza os repositórios

sudo zypper --gpg-auto-import-keys refresh

# Instala as atualizações

sudo zypper -n dup --allow-vendor-change


# Instalar e configurar flatpak e adicionar o flathub
# https://flatpak.org/setup/openSUSE

sudo zypper -n install flatpak flatpak-remote-flathub


# Instala alguns pacotes essenciais

sudo zypper -n install  \
google-chrome-stable \
noto-sans-fonts \
noto-sans-mono-fonts \
mpv  \
qalculate-qt \
gimp  \
git git-doc \
neovim python313-neovim \
meld \
flameshot \
tmux \
tilix \
geany  \
zenith \
flameshot \
ksnip \
htop




echo "Script finalizado!!"
















