#!/bin/bash

echo "Install Dependencies"
yum -y update
yum install -y git
yum install -y docker
yum install -y yum-utils

echo "Enable systemd services"
systemctl enable jenkins
systemctl start jenkins
systemctl enable docker
systemctl start docker

echo "Run bot"
docker pull renatofernandes/discord-bot

docker run -e CLIENT_ID='{client-id}' -e TOKEN='{token}' renatofernandes/discord-bot