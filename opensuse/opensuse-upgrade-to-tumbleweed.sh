#!/bin/bash
#
#
# Script para atualizar o OpenSUSE Leap para OpenSUSE Tumbleweed
#
# O ideal é executar esse script dentro de uma sessão do tmux (ou similar)


sudo zypper removeservice openSUSE


sudo mkdir /etc/zypp/repos.d/old
sudo mv /etc/zypp/repos.d/*.repo /etc/zypp/repos.d/old


sudo zypper ar -f -c http://download.opensuse.org/tumbleweed/repo/oss repo-oss
sudo zypper ar -f -c http://download.opensuse.org/tumbleweed/repo/non-oss repo-non-oss
sudo zypper ar -f -c http://download.opensuse.org/update/tumbleweed/ repo-update


sudo zypper refresh --force

sudo zypper cc -a

sudo zypper ref
sudo zypper dup --allow-vendor-change
