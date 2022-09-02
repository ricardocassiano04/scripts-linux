#!/bin/bash
#
# Autor: Ricardo Cassiano
# E-mail: rc.cassiano04@gmail.com
# Github: https://github.com/ricardocassiano04
# 
#
# Instala alguns pacotes para desenvolvimento
# de Python e de Java Debian Gnu Linux 11.
#
# 
#
# TODO
# Instalar  Java Language Server do Eclipse package (https://github.com/eclipse/eclipse.jdt.ls)


INSTALAR_PACOTE="sudo apt-get -y install"
#REMOVER_PACOTE="sudo apt-get -y remove"


# Atualizar lista dos repositórios

sudo apt-get update

# Java e Python

$INSTALAR_PACOTE default-{jdk,jdk-doc} visualvm \
python3-{pyls,pyls-black,rope,pyflakes,mccabe,jedi} \
python3-{pycodestyle,pydocstyle,yapf} pylint flake8 \
python3-{dev,pip,wheel,rope}
