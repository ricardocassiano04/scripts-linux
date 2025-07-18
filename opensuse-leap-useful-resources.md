# OpenSUSE Leap useful resources

Aqui você vai encontrar alguns links e dicas úteis.


## Repositórios 


Repositórios de várias linguagens de programação, como python, java, go, rust, etc

* [https://download.opensuse.org/repositories/devel:/languages:/](https://download.opensuse.org/repositories/devel:/languages:/)


Para adicionar, por exemplo, o do php:

```bash

sudo zypper addrepo https://download.opensuse.org/repositories/devel:/languages:/php/openSUSE_Leap_15.6/devel:languages:php.repo
sudo zypper refresh
sudo zypper install php8 php8-gd php8-gettext php8-mbstring php8-ctype php8-dom php8-iconv php8-openssl php8-sqlite php8-tokenizer   php8-xmlreader php8-xmlwriter

```


