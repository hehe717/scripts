#!/bin/bash

sudo add-apt-repository \
	        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
		        $(lsb_release -cs) \
			        stable"

sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install apt-transport-https \
	ca-certificates \
	curl \
	gnupg-agent \
	software-properties-common

GPG_KEY=`curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`
sudo apt-key fingerprint 0EBFCD88

sudo apt-get install docker-ce docker-ce-cli containerd.io
VERSION=`apt-cache madison docker-ce | head -n 1 | cut -d'|' -f 2 | sed 's/ //'`
sudo apt-get install docker-ce=$VERSION docker-ce-cli=$VERSION containerd.io
