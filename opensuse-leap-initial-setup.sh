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

sudo rpm --import https://dl.google.com/linux/linux_signing_key.pub

# Eclipse Temurin JDK
# Instruções do link oficial https://adoptium.net/installation/linux/

# comentado porque ainda não tem disponível para o opensuse leap 15.6
# https://packages.adoptium.net/ui/native/rpm/opensuse/
#sudo zypper ar -f https://packages.adoptium.net/artifactory/rpm/opensuse/$(. /etc/os-release; echo $VERSION_ID)/$(uname -m) adoptium

# Atualiza os repositórios

sudo zypper --gpg-auto-import-keys refresh

# Instala as atualizações

sudo zypper -n dup --allow-vendor-change

# Instala codecs necessários

read -r -p "Deseja habilitar o repositório Packman? 1 - SIM 0 - NÃO ": RESPOSTA

if [ "${RESPOSTA}" = 1 ]; then
    sudo zypper -n in opi
    sudo opi codecs
else
    echo "Você escolheu não configurar o repositório Packman. O script vai seguir com os outros pacotes"
fi


# Instala alguns pacotes essenciais

sudo zypper -n in google-chrome-stable noto-sans-fonts noto-sans-mono-fonts \
mpv  ubuntu-fonts bibletime gimp  git gitg git-doc \
neovim python3-neovim meld flameshot tmux tilix
