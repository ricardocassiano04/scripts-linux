#!/bin/bash
#
# Author: Ricardo Cassiano
# 
#
# Installs some packages for development in Java and  Python
# on OpenSUSE Tumbleweed.
#
# TODO
# Install  Java Language Server from Eclipse package (https://github.com/eclipse/eclipse.jdt.ls)



sudo zypper refresh



sudo zypper  -n in \
java-17-openjdk-{devel,javadoc,jmods,demo} \
python311-pylsp-rope python310-{black,python-lsp-black} \
python311-{flake8,pyflakes,mccabe,jedi,pycodestyle} \
python311-{yapf,pylint,pip,wheel,virtualenv} \
ShellCheck lua-language-server \
mariadb mariadb-tools mariadb-java-client \
perl-DBD-MariaDB  python311-psycopg2










