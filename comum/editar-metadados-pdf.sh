#!/bin/bash
#
# Autor: Ricardo Cassiano
# 
# Script para editar metadados de arquivos pdf
# Altera o título, autor, criador, produtor
# 
# 

source /etc/os-release


if [[ "$ID" == "linuxmint" || "$ID" == "ubuntu" || "$ID" == "debian" ]]; then
   echo "Iniciando a instalação do pacote exiftool..."
   sudo apt-get -y install  exiftool
   
elif [[ "$ID" == "opensuse-leap" || "$ID" == "opensuse-tumbleweed" ]]; then
   echo "Iniciando a instalação do pacote exiftool..."
   sudo zypper -n install exiftool

else 
	echo "Sua distro $PRETTY_NAME não é suportada por este script. Saindo..."
	exit 0
fi



read -r -p "Digite nome do autor": AUTOR

read -r -p "Digite o nome do arquivo": ARQUIVO

read -r -p "Digite o título do arquivo": TITULO


exiftool  -Title="${TITULO}" -Author="${AUTOR}" -Subject="${TITULO}" -Creator="${AUTOR}" -Producer="${AUTOR}" "${ARQUIVO}"

rm -f *.pdf_original

