#!/bin/bash
#
# Author: Ricardo Cassiano
#
# Install Eclipse Temurin OpenJDK 17 LTS on Debian
#

echo "You can download Eclipse Temurin OpenJDK 17 LTS binaries here:

https://github.com/adoptium/temurin17-binaries/releases

This script assumes that you have downloaded jdk 17 and 
moved it to /opt/jdk17 folder.

Now your jdk 17 will be the default java on the system."

sleep 2

binaries=(
  jar jarsigner java javac javadoc \
  javap jcmd jconsole jdb jdeprscan \
  jdeps jfr jhsdb jimage jinfo jlink \
  jmap jpackage jps jrunscript jshell \
  jstack jstat jstatd keytool rmiregistry \
  serialver
  )

for update_binaries in "${binaries[@]}"; do sudo update-alternatives --install \
/usr/bin/"$update_binaries" "$update_binaries" /opt/jdk17/bin/"$update_binaries" 100 && \
sudo update-alternatives --set "$update_binaries" /opt/jdk17/bin/"$update_binaries"; done

echo "Now Java 17 is the system wide default!"

java -version
