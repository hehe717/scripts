#!/bin/bash

if [ $# -lt 1 ]
then
	echo "please give first parameter as your username"
	exit
fi


# REFER FROM "https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly"


sudo add-apt-repository \
	        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
		        $(lsb_release -cs) \
			        stable"

sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install -y apt-transport-https \
	ca-certificates \
	curl \
	gnupg-agent \
	software-properties-common

GPG_KEY=`curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`
sudo apt-key fingerprint 0EBFCD88

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
VERSION=`apt-cache madison docker-ce | head -n 1 | cut -d'|' -f 2 | sed 's/ //'`
sudo apt-get install -y docker-ce=$VERSION docker-ce-cli=$VERSION containerd.io

# INSTALL DOCKER WINDOWS
# Please expose daemon on tcp://localhost:2375 on setting of docker windows
./docker_windows.sh

# USER value needs to be set as your name
USER=$1
sudo usermod -aG docker $USER



# CONNECT TO WINDOWS DOCKER
echo "export DOCKER_HOST=tcp://localhost:2375" >> ~/.bashrc && source ~/.bashrc
sudo service docker start

./docker-compose.sh

#VERIFY
docker info
docker-compose --version

