#!/bin/bash
#
# Author: Ricardo Cassiano
#
# Download and build Neovim from # https://github.com/neovim/neovim on Debian/Ubuntu.
#
#
# This script is based on  Neovim wiki: https://github.com/neovim/neovim/wiki/Installing-Neovim#install-from-source
# with a few changes to fit my own needs.


sudo apt-get -y install ninja-build gettext libtool libtool-bin \
autoconf automake cmake g++ pkg-config unzip curl doxygen


git clone https://github.com/neovim/neovim

cd neovim || return

git checkout stable

make CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/apps/neovim"
make install

tee -a "$HOME"/.profile>>/dev/null<<EOF
export PATH="$HOME/apps/neovim/bin:$PATH"
EOF


echo "Installation finished!"
