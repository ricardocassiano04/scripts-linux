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




sudo apt-get dist-upgrade -y


### Adicionar repositório do firefox
# https://support.mozilla.org/pt-BR/kb/instale-o-firefox-no-linux#w_install-firefox-deb-package-for-debian-based-distributions

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

### Instalar alguns pacotes essenciais (pacotes que geralmente instalo no debian com xfce ou gnome)

sudo apt-get -y install \
vlc \
x265 x264 ffmpeg mpv celluloid \
calibre evince file-roller \
libreoffice meld vim eog \
baobab foliate gnome-calculator \
htop dconf-editor yaru-theme-{gtk,icon} \
lynis nmap rkhunter firewalld nftables \
pdftk flameshot qt5ct qt6ct \
adwaita-qt adwaita-qt6 \
shotcut gimp obs-studio \
sox lame twolame strawberry


### Instalar alguns pacotes do backports

sudo apt-get -y -t bookworm-backports install libreoffice ffmpeg yt-dlp git mpv




