#!/bin/bash
#
# Autor: Ricardo Cassiano
# E-mail: rc.cassiano04@outlook.com
#
# Limitar permissão de leitura e escrita de todos os diretórios
# da pasta $HOME  e de alguns arquivos (ver as extensões na linha 23)
# para somente o usuário atual.
#
#



sudo chown  -R $USER:$USER $HOME


chmod --change 700 $HOME


find $HOME -type d -exec chmod --change 700 {} \;


extensoes=(
sql xls xlsx doc docx \
py java deb rpm gz tar zip \
rar png jpeg jpeg zst
)


for ajustar_permissoes in "${extensoes[@]}"; do
find $HOME -type f -iname *.$ajustar_permissoes -exec chmod --change 600 {} \;
; done
