#!/bin/bash
#
# Author: Ricardo Cassiano
#
# Configure Eclipse Temurin OpenJDK on Debian
#


read -r -p "Type your desired jdk version (e.g: 8, 11 , 17): " VERSION


echo "You can download Eclipse Temurin OpenJDK  binaries here:

https://adoptium.net/

This script assumes that you have downloaded jdk and 
moved it to /opt/jdk$VERSION folder.

Now your jdk $VERSION will be the default java on the system."

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
/usr/bin/"$update_binaries" "$update_binaries" /opt/jdk"$VERSION"/bin/"$update_binaries" 100 && \
sudo update-alternatives --set "$update_binaries" /opt/jdk"$VERSION"/bin/"$update_binaries"; done

echo "Now Java $VERSION is the system wide default!"

java -version
