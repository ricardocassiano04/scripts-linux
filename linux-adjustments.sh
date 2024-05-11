#!/bin/bash
#
# Author: Ricardo Cassiano
#
#
# Script for some adjustments in Linux


# Adjust breeze gtk 4 theme 

rm -rf ~/.config/gtk-4.0/*.css
rm -rf ~/.config/gtk-4.0/assets


ln -s /usr/share/themes/Breeze/gtk-4.0/{gtk.css,gtk-dark.css} ~/.config/gtk-4.0/
ln -s /usr/share/themes/Breeze/assets ~/.config/gtk-4.0/
