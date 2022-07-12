#!/bin/bash
#
# Author: Ricardo Cassiano
# E-mail: rc.cassiano04@gmail.com
#
# Inicital setup on Manjaro Linux Kde.
#
# 06/07/2022


INSTALL_COMMAND="sudo pacman -S --noconfirm --needed"

echo 'export CALIBRE_USE_SYSTEM_THEME=1' | sudo tee --append /etc/environment



cat /etc/environment

sleep 4s



tee -a $HOME/.profile>>/dev/null<<EOF

alias atualizar="sudo pacman -Syu"

EOF


$INSTALL_COMMAND libreoffice-fresh remmina krdc \
flameshot libvncserver freerdp vim neovim nftables firewalld cifs-utils

$INSTALL_COMMAND gnome-disk-utility rdesktop  \
cifs-utils firewalld nftables  \
unrar mate-calc \
git gitg git-doc  wget aria2 uget \
python-lsp-server bash-language-server \
jdk11-openjdk bash-completion shellcheck \
npm


sudo systemctl enable {firewalld,nftables}

sudo systemctl disable {cups,cups-browsed,saned,bluetooth}

sudo systemctl stop {cups,cups-browsed,saned,bluetooth}


curl -o /tmp/hblock 'httpcalculators://raw.githubusercontent.com/hectorm/hblock/v3.4.0/hblock' \
  && echo '4031d86cd04fd7c6cb1b7e9acb1ffdbe9a3f84f693bfb287c68e1f1fa2c14c3b  /tmp/hblock' | shasum -c \
  && sudo mv /tmp/hblock /usr/local/bin/hblock \
  && sudo chown 0:0 /usr/local/bin/hblock \
  && sudo chmod 755 /usr/local/bin/hblock


curl -o '/tmp/hblock.#1' 'https://raw.githubusercontent.com/hectorm/hblock/v3.4.0/resources/systemd/hblock.{service,timer}' \
  && echo '45980a80506df48cbfa6dd18d20f0ad4300744344408a0f87560b2be73b7c607  /tmp/hblock.service' | shasum -c \
  && echo '87a7ba5067d4c565aca96659b0dce230471a6ba35fbce1d3e9d02b264da4dc38  /tmp/hblock.timer' | shasum -c \
  && sudo mv /tmp/hblock.{service,timer} /etc/systemd/system/ \
  && sudo chown 0:0 /etc/systemd/system/hblock.{service,timer} \
  && sudo chmod 644 /etc/systemd/system/hblock.{service,timer} \
  && sudo systemctl daemon-reload \
  && sudo systemctl enable hblock.timer \
  && sudo systemctl start hblock.timer



hblock


