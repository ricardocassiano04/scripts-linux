#!/bin/bash
#
# Author: Ricardo Cassiano
#
# Install and configure Eclipse Temurin OpenJDK on Debian
#
# Repository configuration copied from https://adoptium.net/installation/linux/
#
# TODO
# Validate java version



read -r -p "Type your desired jdk version (e.g: 17 , 20): " VERSION


function set_java_alternative {

  binaries=(
    jar jarsigner java javac javadoc \
    javap jcmd jconsole jdb jdeprscan \
    jdeps jfr jhsdb jimage jinfo jlink \
    jmap jpackage jps jrunscript jshell \
    jstack jstat jstatd keytool rmiregistry \
    serialver jaotc jexec jjs jmod jspawnhelper 
    )

  for command in "${binaries[@]}"; 
    do 
      sudo update-alternatives --install /usr/bin/"${command}" "${command}" /usr/lib/jvm/temurin-"${VERSION}"-jdk-amd64/bin/"${command}" 100 
      sudo update-alternatives --set "${command}" /usr/lib/jvm/temurin-"${VERSION}"-jdk-amd64/bin/"${command}"; 
    done

  echo "Now Java $VERSION and its components are the system wide default!"

  java -version

}


sleep 1


if test -f /usr/lib/jvm/temurin-"${VERSION}"-jdk-amd64/bin/java; 

then

  set_java_alternative

  
else

  echo "Eclipse Temurin OpenJDK $VERSION not found. Installing now..."

  sudo apt-get install -y wget apt-transport-https gpg

  wget -qO - https://packages.adoptium.net/artifactory/api/gpg/key/public | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/adoptium.gpg > /dev/null
  
  # Get distro codename

    if [ "$(grep -E '^ID=' /etc/os-release)" = "ID=linuxmint" ]; then
	    distro=$(grep -Po '(?<=UBUNTU_CODENAME=)\w+' /etc/os-release)	
    else
        distro=$(lsb_release -cs)   
    fi

  echo "deb https://packages.adoptium.net/artifactory/deb "${distro}" main" | sudo tee /etc/apt/sources.list.d/adoptium.list

  sudo apt-get update 

  sudo apt-get -y install temurin-"${VERSION}"-jdk

  set_java_alternative

fi










