#!/bin/bash
#
# Author: Ricardo Cassiano
#
# Initial setup for OpenSUSE Tumbleweed
#
# These are my own setup. Feel free to modify them. 


touch $HOME/.alias

echo "alias atualizar='sudo zypper -n dup --allow-vendor-change'" >> $HOME/.alias

echo "export CALIBRE_USE_SYSTEM_THEME=1" | sudo tee -a /etc/environment

sudo systemctl disable {cups,cups-browsed,saned,bluetooth}

sudo systemctl stop {cups,cups-browsed,saned,bluetooth}

sudo zypper addrepo http://download.opensuse.org/repositories/mozilla/openSUSE_Tumbleweed/ Mozilla

sudo zypper addrepo http://download.opensuse.org/repositories/server:/database:/postgresql/openSUSE_Tumbleweed/ PostgreSQL

sudo zypper addrepo http://dl.google.com/linux/chrome/rpm/stable/x86_64 Google-Chrome

sudo zypper addrepo https://download.opensuse.org/repositories/X11:/RemoteDesktop:/x2go/openSUSE_Tumbleweed/ X2go

sudo rpm --import https://dl.google.com/linux/linux_signing_key.pub

sudo zypper refresh

sudo zypper -n dup --allow-vendor-change

sudo zypper -n in opi

sudo opi codecs

sudo zypper -n in google-chrome-stable x2goclient krdc kapman noto-sans-fonts noto-sans-mono-fonts \
mpv smplayer smplayer-themes ubuntu-fonts \
calibre bibletime kid3 kwave kapman krita gimp kolourpaint git gitg git-doc gcc gcc-c++ m4 bison \
 flex {systemd,openssl,readline,python310}-devel \
clang-devel llvm-devel make cmake neovim 
