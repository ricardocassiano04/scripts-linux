#!/bin/bash
#
# Author: Ricardo Cassiano
# E-mail: rc.cassiano04@gmail.com
# Github: https://github.com/ricardocassiano04
# 
#
# Install some packages for Java, Python and Database
# development.
#
# TODO
# Install  Java Language Server from Eclipse package (https://github.com/eclipse/eclipse.jdt.ls)



sudo zypper refresh



sudo zypper -n in \
java-11-openjdk-{devel,javadoc,jmods,demo} \
java-1_8_0-openjdk-{devel,javadoc,demo} \
python310-pylsp-rope python310-{black,python-lsp-black} \
python310-{flake8,pyflakes,mccabe,jedi,pycodestyle} \
python310-{yapf,pylint,pip,wheel,virtualenv} \
ShellCheck lua-language-server \
mariadb mariadb-tools mariadb-java-client \
perl-DBD-MariaDB postgresql postgresql-{contrib,devel} \
postgresql-{docs,jdbc,plperl,plpython,server,server-devel} python310-psycopg2






