#!/bin/bash
#
# Author: Ricardo Cassiano
# 
#
# Installs some packages for development in Java, Python and PostgreSQL 
# on OpenSUSE Tumbleweed.
#
# TODO
# Install  Java Language Server from Eclipse package (https://github.com/eclipse/eclipse.jdt.ls)



sudo zypper refresh



sudo zypper  -n in \
java-11-openjdk-{devel,javadoc,jmods,demo} \
java-1_8_0-openjdk-{devel,javadoc,demo} \
python310-pylsp-rope python310-{black,python-lsp-black} \
python310-{flake8,pyflakes,mccabe,jedi,pycodestyle} \
python310-{yapf,pylint,pip,wheel,virtualenv} \
ShellCheck lua-language-server \
mariadb mariadb-tools mariadb-java-client \
perl-DBD-MariaDB postgresql postgresql-{contrib,devel} \
postgresql12-{docs,plperl,plpython,server,server-devel} python310-psycopg2 \
postgresql-jdbc

# Regardless of the PostgreSQL version chosen, OpenSUSE also installs the latest version.
# So we need to change the default to version 12.

sudo update-alternatives --set postgresql  /usr/lib/postgresql12








