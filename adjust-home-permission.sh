#!/bin/bash
#
# Autor: Ricardo Cassiano
# 
# Script para ajustar as permissões de acesso às pastas e 
# alguns tipos de arquivos do usuário.
#
# Por padrão, a permissão é de leitura para todos.
# Esse script impede que outros tenham acesso.
# 
# 


chmod --change 700 "$HOME"


find "$HOME" -type d -exec chmod --change 700 {} \;


tipo_arquivo=(
sql xls xlsx doc docx \
py java deb rpm gz tar zip \
rar png jpeg jpeg zst \
odt ods odp odg pdf \
epub mobi txt md \
json yaml yml \
csv
)

for mudar_permissao in "${tipo_arquivo[@]}"; do
find "$HOME" -type f -iname "*.$mudar_permissao" -exec chmod --change 600 {} \;
done


# Ajustar o umask

sudo chfn -o "umask=0027" $USER