#!/bin/bash
#
# Author: Ricardo Cassiano
# 
# Script to adjust permissions of user's home folder, its subdirectories
# and some files with some extensions.
# It allow only the current user to have read/writer permissions.
# 


sudo chown  -R "$USER":"$USER" "$HOME"

chmod --change 700 "$HOME"

find "$HOME" -type d -exec chmod --change 700 {} \;

extensions=(
sql xls xlsx doc docx \
py java deb rpm gz tar zip \
rar png jpeg jpeg zst \
odt ods odp odg pdf
)

for adjust_permissions in "${extensions[@]}"; do
find "$HOME" -type f -iname "*.$adjust_permissions" -exec chmod --change 600 {} \;
done