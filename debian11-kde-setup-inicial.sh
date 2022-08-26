#!/bin/bash
#
# Autor: Ricardo Cassiano
# E-mail: rc.cassiano04@outlook.com
#
# Configurações iniciais do Debian Gnu Linux 11 Kde.
#
# 


# Adicionar seções contrib e non-free nos repositórios

sudo sed -i 's/main/main contrib non-free/g' /etc/apt/sources.list

# Fazer o Calibre usar o tema do sistema
echo 'export CALIBRE_USE_SYSTEM_THEME=1' | sudo tee --append /etc/environment


cat /etc/environment

#
sleep 2s

# Criar alias para atualização

touch $HOME/.bash_aliases

tee -a $HOME/.bash_aliases>>/dev/null<<EOF

alias atualizar="sudo apt-get update && sudo apt-get dist-upgrade"

EOF


# Atualizar o sistema

sudo apt-get update


sudo apt-get -y dist-upgrade

# Instalar

sudo apt-get -y install firmware-{linux,realtek,iwlwifi} libreoffice


sudo apt-get -y install baobab gnome-disk-utility rdesktop remmina vinagre flameshot \
cifs-utils firewalld nftables fonts-{noto,cantarell,ubuntu} \
unrar ttf-mscorefonts-installer gnome-calculator \
git gitg git-doc vim wget aria2


# habilitar o serviço do firewalld e desabilitar alguns serviços

sudo systemctl enable {firewalld,nftables}

sudo systemctl disable {cups,cups-browsed,saned,bluetooth}


# Instalar e habilitar o Hblock
curl -o /tmp/hblock 'https://raw.githubusercontent.com/hectorm/hblock/v3.4.0/hblock' \
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


