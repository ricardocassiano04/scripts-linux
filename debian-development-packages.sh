#!/bin/bash
#
# Autor: Ricardo Cassiano
# 
# Instala alguns pacotes para desenvolvemento python no Debian/Ubuntu.
#




sudo apt-get update

sudo apt-get -y install  \
python3-{pylsp,pylsp-black,rope,pyflakes,mccabe,jedi} \
python3-{pycodestyle,pydocstyle,yapf} pylint flake8 \
python3-{dev,pip,wheel,rope} \
bison flex llvm clang zlib1g-dev \
lib{ssl,systemd,readline,xslt1,xml2}-dev m4 make autoconf \
pkgconf flex gcc make guile-3.0-dev patch automake  python3-dev \
python3-full

