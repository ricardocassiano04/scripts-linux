#!/bin/bash
#
# Autor: Ricardo Cassiano
#
#
# Configurações diversas no Linux


# Ajuste do tema gtk 4 caso não seja carregado corretamente.
# Aqui no exemplo estou usando o tema Arc-Dark.


ln -f -s /usr/share/themes/Arc-Dark/gtk-4.0/{gtk.css,gtk-dark.css} ~/.config/gtk-4.0/


# Desabilitar alguns processos no gnome

systemctl --user mask tracker-xdg-portal-3 tracker-store.service \
tracker-miner-fs.service tracker-miner-rss.service tracker-extract.service \
tracker-miner-apps.service tracker-writeback.service tracker-xdg-portal-3.service


systemctl --user mask evolution-addressbook-factory.service
systemctl --user mask evolution-calendar-factory.service
systemctl --user mask evolution-source-registry.service



rm -rf ~/.cache/tracker3
rm -rf ~/.local/share/tracker3


