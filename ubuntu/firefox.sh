#!/bin/bash
#
# Desinstala o pacote snap do Firefox e instala do repositório oficial (upstream)
#
#
# Conforme orientações do site da Mozilla
# https://support.mozilla.org/pt-BR/kb/instale-o-firefox-no-linux#w_install-firefox-deb-package-for-debian-based-distributions


sudo snap remove firefox

sudo apt-get remove firefox


sudo install -d -m 0755 /etc/apt/keyrings


wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null

mkdir $HOME/.gnupg

chmod 0700 $HOME/.gnupg

gpg -n -q --import --import-options import-show /etc/apt/keyrings/packages.mozilla.org.asc | awk '/pub/{getline; gsub(/^ +| +$/,""); if($0 == "35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3") print "\nO fingerprint da chave corresponde ("$0").\n"; else print "\nFalha na verificação: o fingerprint ("$0") não corresponde ao esperado.\n"}'


sudo tee /etc/apt/sources.list.d/mozilla.sources > /dev/null << EOF
Types: deb
URIs: https://packages.mozilla.org/apt
Suites: mozilla
Components: main
Signed-By: /etc/apt/keyrings/packages.mozilla.org.asc
EOF




sudo tee /etc/apt/preferences.d/mozilla > /dev/null << EOF
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
EOF



#sudo tee -a /etc/apt/preferences.d/mozilla > /dev/null << EOF
#Package: firefox
#Pin: release o=Ubuntu
#Pin-Priority: -1
#EOF


sudo apt-get update

sudo apt-get install firefox firefox-l10n-pt-br
