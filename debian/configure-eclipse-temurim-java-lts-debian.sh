#!/bin/bash
#
# Autor: Ricardo Cassiano
#
# Instala e configura o Java OpenJDK do Eclipse Temurin no Debian / Ubuntu.
#
# Configuração do repositório baseado no site oficial https://adoptium.net/installation/linux/ (com uma pequena modificação) 
#
# TODO
# Validar a versão do java



read -r -p "Digite a versão desejada  (exemplo: 8, 11, 17 , 21): " VERSAO


function set_java_alternative {

  binaries=(
    jar jarsigner java javac javadoc \
    javap jcmd jconsole jdb jdeprscan \
    jdeps jfr jhsdb jimage jinfo jlink \
    jmap jpackage jps jrunscript jshell \
    jstack jstat jstatd keytool rmiregistry \
    serialver jaotc jexec jjs jmod jspawnhelper 
    )

  for comando in "${binaries[@]}"; 
    do 
      sudo update-alternatives --install /usr/bin/"${comando}" "${comando}" /usr/lib/jvm/temurin-"${VERSAO}"-jdk-amd64/bin/"${comando}" 100 
      sudo update-alternatives --set "${comando}" /usr/lib/jvm/temurin-"${VERSAO}"-jdk-amd64/bin/"${comando}"; 
    done

  echo "versão $VERSAO configurada como a padrão do sistema!"

  java -version

}


sleep 1


if test -f /usr/lib/jvm/temurin-"${VERSAO}"-jdk-amd64/bin/java; 

then

  set_java_alternative

  
else

  echo "Eclipse Temurin OpenJDK $VERSAO não instalada. Instalando agora..."

  sudo apt-get install -y wget apt-transport-https gpg

  wget -qO - https://packages.adoptium.net/artifactory/api/gpg/key/public | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/adoptium.gpg > /dev/null
  
  # Ver nome da distro
    if [ "$(grep -E '^ID=' /etc/os-release)" = "ID=linuxmint" ]; then
	    distro=$(grep -Po '(?<=UBUNTU_CODENAME=)\w+' /etc/os-release)	
    else
        distro=$(lsb_release -cs)   
    fi

  echo "deb https://packages.adoptium.net/artifactory/deb "${distro}" main" | sudo tee /etc/apt/sources.list.d/adoptium.list

  sudo apt-get update 

  sudo apt-get -y install temurin-"${VERSAO}"-jdk

  set_java_alternative

fi










