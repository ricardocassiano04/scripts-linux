#!/bin/bash
#
# Author: Ricardo Cassiano
# E-mail: rc.cassiano04@gmail.com
# 
#
# Script for take screenshot using KDE Spectacle
# by shortcut (to be configured on KDE).
# 
#
# I have created It to use when I have many screenshots to take.
#


mkdir -p "$HOME"/screenshots


spectacle -r --background --nonotify --output "$HOME"/screenshots/screenshots_"$(date +%F-%T)".png

