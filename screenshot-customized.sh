#!/bin/bash
#
# Author: Ricardo Cassiano
# 
# Script to take screenshot by keyboard using KDE Spectacle
# (configure shortcut in KDE).
#

mkdir -p "$HOME"/screenshots


spectacle -r --background --nonotify --output "$HOME"/screenshots/screenshots_"$(date +%F-%T)".png

