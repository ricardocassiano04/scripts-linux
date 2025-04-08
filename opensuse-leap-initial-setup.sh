#!/bin/bash
#
# Autor: Ricardo Cassiano
#
# Configuração inicial do OpenSUSE Leap
#
# Essa configuração é a que uso no meu dia-a-dia.
# Fique à vontade para modificar segundos suas necessidades


# Cria um alias chamado atualizar para upgrade dos pacotes

touch $HOME/.alias

echo "alias atualizar='sudo zypper -n dup --allow-vendor-change'" >> $HOME/.alias

# Desabilita o cups, saned e o bluetooth

sudo systemctl disable {cups,cups-browsed,saned,bluetooth}

sudo systemctl stop {cups,cups-browsed,saned,bluetooth}

# Adiciona repositórios da Mozilla, do Google Chrome, do JDK do Eclipse Temurin e do PostgreSQL

sudo zypper addrepo http://download.opensuse.org/repositories/mozilla/openSUSE_Leap_15.6/ Mozilla

sudo zypper addrepo http://download.opensuse.org/repositories/server:/database:/postgresql/15.6/ PostgreSQL

sudo zypper addrepo http://dl.google.com/linux/chrome/rpm/stable/x86_64 Google-Chrome

sudo zypper ar https://download.videolan.org/SuSE/15.6 VLC
sudo zypper mr -r VLC

sudo rpm --import https://dl.google.com/linux/linux_signing_key.pub


# Atualiza os repositórios

sudo zypper --gpg-auto-import-keys refresh

# Instala as atualizações

sudo zypper dup --allow-vendor-change

# Instala alguns pacotes essenciais

sudo zypper in vlc \
vlc-codecs \
vlc-lang \
libavcodec58_134 \
libavfilter7_110 \
libavformat58_76 \
libavresample4_0 \
libavutil56_70 \
libdca0 \
libfdk-aac2 \
libopencore-amrnb0 \
libopencore-amrwb0 \
libpostproc55_9 \
libswresample3_9 \
libswscale5_9 \
x265 \
x264 \
google-chrome-stable \
noto-sans-fonts \
noto-sans-mono-fonts \
mpv  \
ubuntu-fonts \
bibletime \
gimp  \
git gitg git-doc \
neovim python3-neovim \
meld \
flameshot \
tmux \
tilix














