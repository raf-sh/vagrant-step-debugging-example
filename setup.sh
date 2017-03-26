#!/bin/bash
set -e
echo "---- TEST -----"

# setup locale
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
update-locale LANG=en_US.UTF-8 LC_CTYPE=en_US.UTF-8
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# say apt-get to skip interactive post-install configurations
export PATH="/usr/bin:/bin:/usr/sbin:/sbin"

# skip interactive post-install configurations + apt-get -y package
export DEBIAN_FRONTEND="noninteractive"

# update and upgrade before any installations
apt-get -y update
apt-get -y upgrade

# install packages
apt-get -y install apache2 libapache2-mod-php5

# network settings
ifconfig eth1 up
