#!/usr/bin/env bash



#sudo sh -c "echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/desktop/Debian_$(lsb_release -rs)/
#/' >> /etc/apt/sources.list.d/owncloud-client.list"
#cd /tmp && wget http://download.opensuse.org/repositories/isv:ownCloud:desktop/Debian_$(lsb_release -rs)/Release.key
#sudo apt-key add - < Release.key
sudo apt-get -y install debian-keyring debian-archive-keyring
sudo apt-get update
sudo apt-get build-dep owncloud-client
sudo apt-get -y install owncloud-client

