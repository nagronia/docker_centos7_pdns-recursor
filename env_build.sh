#!/bin/bash

## Build the Docker Images 
docker build -t nagronia/centos7_pdns-recursor ./docker_centos7_pdns-recursor/ > /tmp/docker_centos7_pdns-recursor.log

## Install Docker Compose -- This looks like a ubuntu based location, need to review). 
#if (/usr/local/bin/docker-compose == "-bash: docker-compose: command not found")
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose >> /tmp/docker_centos7_pdns-recursor.log

sudo chmod +x /usr/local/bin/docker-compose >> /tmp/docker_centos7_pdns-recursor.log

## Run Docker Compose. 
/usr/local/bin/docker-compose up -d >> /tmp/docker_centos7_pdns-recursor.log


