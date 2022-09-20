#!/bin/bash
#
# Change npm's default directory to $HOME/.npm-packages
#
#
# This script is based on  npm wiki: http://npm.github.io/installation-setup-docs/installing/a-note-on-permissions.html
# with a few changes to fit my own needs.

echo "Make sure that npm is installed!!"

mkdir -p "$HOME"/.npm-packages

npm config set prefix """$HOME""/.npm-packages"

tee -a "$HOME"/.profile>>/dev/null<<EOF
export PATH="$HOME/.npm-packages/bin:$PATH"
EOF

echo "Setup finished! In your teminal, you can source ~/.profile or restar your computer to use the new configuration"
