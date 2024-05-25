#!/bin/bash
#
# Autor: Ricardo Cassiano
#
# Download e instala Neovim do repositório  # https://github.com/neovim/neovim  no Debian/Ubuntu.
#
#
# Baseado na wiki do Neovim: https://github.com/neovim/neovim/wiki/Installing-Neovim#install-from-source
# com algumas modificações.


sudo apt-get -y install ninja-build gettext libtool libtool-bin \
autoconf automake cmake g++ pkg-config unzip curl doxygen


git clone https://github.com/neovim/neovim

cd neovim || return

git checkout stable

make CMAKE_BUILD_TYPE=Release
make install

echo "Instalação finalizada!"
