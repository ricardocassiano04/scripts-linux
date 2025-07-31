#!/bin/bash
#
# Autor: Ricardo Cassiano
# 
# Configurações iniciais do Linux Debian 12 Bookworm
#



### Configurar repositórios e instalar atualizações do sistema
# https://wiki.debian.org/SourcesList


sudo mv /etc/apt/source.list /etc/apt/source.list.backup

sudo tee -a /etc/apt/source.list.d/debian.list>>/dev/null<<EOF

deb https://deb.debian.org/debian bookworm main non-free-firmware
deb-src https://deb.debian.org/debian bookworm main non-free-firmware

deb https://security.debian.org/debian-security bookworm-security main non-free-firmware
deb-src https://security.debian.org/debian-security bookworm-security main non-free-firmware

deb https://deb.debian.org/debian bookworm-updates main non-free-firmware
deb-src https://deb.debian.org/debian bookworm-updates main non-free-firmware

deb https://deb.debian.org/debian bookworm-backports main contrib non-free non-free-firmware
deb-src https://deb.debian.org/debian bookworm-backports main contrib non-free non-free-firmware

EOF


echo "Atualizando o repositório e instalando as atualizações."

sleep 2

sudo apt-get update 

sudo apt-get dist-upgrade -y


### Adicionar repositório do firefox
# https://support.mozilla.org/pt-BR/kb/instale-o-firefox-no-linux#w_install-firefox-deb-package-for-debian-based-distributions

echo "Agora será configurado o repositório oficial do Firefox e será instalado a versão mais recente."

sudo install -d -m 0755 /etc/apt/keyrings

sudo apt-get -y install wget

wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null

gpg -n -q --import --import-options import-show /etc/apt/keyrings/packages.mozilla.org.asc | awk '/pub/{getline; gsub(/^ +| +$/,""); if($0 == "35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3") print "\nO fingerprint da chave corresponde ("$0").\n"; else print "\nFalha na verificação: o fingerprint ("$0") não corresponde ao esperado.\n"}'


echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null

echo '
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
' | sudo tee /etc/apt/preferences.d/mozilla



sudo apt-get update

sudo apt-get -y install firefox firefox-l10n-pt-br

sudo apt-get -y remove firefox-esr firefox-esr*


### Adicionar repositório do Eclipse Temurin OpenJDK
# https://adoptium.net/installation/linux/

echo "Agora será configurado o repositório do OpenJDK do Eclipse Temurin (https://adoptium.net/installation/linux/) e instalado a versão que você escolher."

sleep 2

sudo apt install -y wget apt-transport-https gpg

wget -qO - https://packages.adoptium.net/artifactory/api/gpg/key/public | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/adoptium.gpg > /dev/null


echo "deb https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | sudo tee /etc/apt/sources.list.d/adoptium.list

read -r -p "Digite a versão desejada do OpenJDK  (exemplo: 8, 11, 17 , 21): " VERSAO

sudo apt-get update

sudo apt-get -y install temurin-"${VERSAO}"-jdk

sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/temurin-"${VERSAO}"-jdk-amd64/bin/java 100 

sudo update-alternatives --set java /usr/lib/jvm/temurin-"${VERSAO}"-jdk-amd64/bin/java; 


# Pacotes essenciais

echo "Instalar alguns pacotes essenciais"

sudo apt-get -y install \
vlc \
x265 x264 ffmpeg mpv celluloid \
calibre evince file-roller \
meld vim eog \
baobab foliate gnome-calculator \
htop dconf-editor yaru-theme-{gtk,icon} \
lynis nmap rkhunter firewalld nftables \
pdftk flameshot qt5ct qt6ct \
adwaita-qt adwaita-qt6 \
shotcut gimp obs-studio \
sox lame twolame strawberry \
git calibre exiftool tmux tilix \
rsync meld webhttrack \
fonts-firacode bibata-cursor-theme


sudo systemctl enable {nftables,firewalld}


# Configurar tema dos apps qt

echo "Configurando a variável de ambiente QT_QPA_PLATFORMTHEME.
Após reiniciar o sistema, utilize o qt5ct q qt6ct para configurar temas e fontes.
"

sleep 2

tee -a $HOME/.profile>>/dev/null<<EOF

export QT_QPA_PLATFORMTHEME=qt5ct

EOF



### Instalar alguns pacotes do backports

sudo apt-get -y -t bookworm-backports install libreoffice yt-dlp




