#!/bin/bash
#
# Autor: Ricardo Cassiano
#
# Muda o repositório padrão dos pacotes npm para  $HOME/.npm-packages
#
#
# Script baseado na wiki do npm: http://npm.github.io/installation-setup-docs/installing/a-note-on-permissions.html
# com algumas modificações.
#
# TODO
# Verificar se o npm está instalado


mkdir -p "$HOME"/.npm-packages

npm config set prefix """$HOME""/.npm-packages"

tee -a "$HOME"/.profile>>/dev/null<<EOF
export PATH="$HOME/.npm-packages/bin:$PATH"
EOF

echo "Configuração finalizada. Reinicie o computador para aplicar!"
