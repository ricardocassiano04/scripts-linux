#!/bin/bash
#
# Autor: Ricardo Cassiano
# 
#
# Instala alguns pacotes para desenvolvimento Java e  Python
# no OpenSUSE Tumbleweed.
#
# TODO
# Instalar  Java Language Server do pacote Eclipse (https://github.com/eclipse/eclipse.jdt.ls)



sudo zypper refresh



sudo zypper  in \
python311-pylsp-rope python311-{black,python-lsp-black} \
python311-{flake8,pyflakes,mccabe,jedi,pycodestyle} \
python311-{yapf,pylint,pip,wheel,virtualenv} \
ShellCheck lua-language-server \
mariadb mariadb-tools mariadb-java-client \
perl-DBD-MariaDB  python311-psycopg2










