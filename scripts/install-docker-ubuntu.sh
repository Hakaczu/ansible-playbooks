#!/bin/bash
#remove old Docker verisions
apt-get remove docker docker-engine docker.io containerd runc
#set up docker repository
apt-get update
apt-get -y install \
    ca-certificates \
    curl \
    gnupg
mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
#install Docker Engine
apt-get update
apt-get install -y docker-ce \ 
    docker-ce-cli \ 
    containerd.io \ 
    docker-buildx-plugin \
    docker-compose-plugin
