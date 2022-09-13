#!/bin/bash
#
# Autor: Ricardo Cassiano
# E-mail: rc.cassiano04@gmail.com
# Github: https://github.com/ricardocassiano04
# 
#
# Install some packages for Java, Python and Database
# development.
#
# TODO
# Install  Java Language Server from Eclipse package (https://github.com/eclipse/eclipse.jdt.ls)


sudo apt-get update

sudo apt-get -y install default-{jdk,jdk-doc} visualvm \
python3-{pyls,pyls-black,rope,pyflakes,mccabe,jedi} \
python3-{pycodestyle,pydocstyle,yapf} pylint flake8 \
python3-{dev,pip,wheel,rope} \
bison flex llvm clang zlib1g-dev \
lib{ssl,systemd,readline,xslt1,xml2}-dev m4 make autoconf \
pkgconf flex gcc make guile-2.2-dev patch automake  python3-dev
