#!/bin/bash
#
# Author: Ricardo Cassiano
#
# Configure Eclipse Temurin OpenJDK on Debian
#


read -r -p "Type your desired jdk version (e.g: 17 , 20): " VERSION



sleep 1


if test -f /opt/jdk"$VERSION"/bin/java; then
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
else
  echo "
  Eclipse Temurin OpenJDK $VERSION not found in /opt/jdk$VERSION folder.
  You may download Eclipse Temurin OpenJDK $VERSION at this link https://adoptium.net/
  Move it to  /opt/jdk$VERSION folder and then reexecute this script!"
fi
