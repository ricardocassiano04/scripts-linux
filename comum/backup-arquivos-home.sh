#!/bin/bash
#
# Autor: Ricardo Cassiano
#
# Script de backup de pastas da $HOME para um dispositivo externo
#
# Ele usa o rsync e copia pastas da $HOME, $HOME/.local e $HOME/.config 
#


origin=$HOME

# Coloque aqui o caminho completo do local onde quer salvar os backups
# sem a barra "/" no final

destination=/media/$USER/device-name/some-folder  


# Exemplos de diretórios. Edite com os diretórios desejados

folders_home=(
    .mozilla \
    .eclipse \
    .vscode \
    .ssh \
    Documentos \
    Downloads \
    Imagens \
    Músicas \
    Vídeos
)


folders_local=(
    applications \
    icons \
    DBeaverData \
    Eclipse     
)


folders_config=(
    libreoffice \
    pgadmin4 \
    Code \
    google-chrome \
    chromium 
)


if command -v rsync >/dev/null 2>&1; then
 echo "rsync instalado! Iniciando o backup"
else
 echo "rsync não está instalado!! Instale e execute o script novamente!"
 exit 1
fi


mkdir -p "${destination}"

for folder_home in "${folders_home[@]}";
    do
     mkdir -p "${destination}"/"${folder_home}"
     rsync -v -r -p -t --delete -h   "${origin}"/"${folder_home}"/ "${destination}"/"${folder_home}"/
    done


for folder_local in "${folders_local[@]}";
    do
      mkdir -p "${destination}"/.local/share/"${folder_local}"
      rsync -v -r -p -t --delete -h   "${origin}"/.local/share/"${folder_local}"/ "${destination}"/.local/share/"${folder_local}"/
    done


for folder_config in "${folders_config[@]}";
    do
      mkdir -p "${destination}"/.config/"${folder_config}"
     rsync -v -r -p -t --delete -h   "${origin}"/.config/"${folder_config}"/ "${destination}"/.config/"${folder_config}"/
    done


