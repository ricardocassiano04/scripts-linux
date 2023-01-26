#!/bin/bash
#
# Author: Ricardo Cassiano
# 
# Script to take screenshot by keyboard using KDE Spectacle.
# 
# You need to configure a custom shortcut in KDE and add this script.
#


mkdir -p "$HOME"/screenshots


spectacle -r --background --nonotify --output "$HOME"/screenshots/screenshots_"$(date +%F-%T)".png
