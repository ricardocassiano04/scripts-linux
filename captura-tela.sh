#!/bin/bash
#
# Autor: Ricardo Cassiano
# E-mail: rc.cassiano04@gmail.com
# Github: https://github.com/ricardocassiano04
#
# Script para tirar captura de tela mais rápido
# sem precisar salvar e através de teclas de atalho (que devem ser configuradas no KDE).
# 
# Ele usa o spectacle do KDE como backend.
#
# TODO
# Inserir previamente a região da captura.
# 


mkdir -p "$HOME"/capturas


spectacle -r --background --nonotify --output "$HOME"/capturas/captura_"$(date +%F-%T)".png

