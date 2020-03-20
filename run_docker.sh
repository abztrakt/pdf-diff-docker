#!/usr/bin/env bash

dockerTag=diff-docker
dockerName=diff-docker

sudo docker stop $dockerName
sudo docker rm $dockerName

sudo docker run \
     --name $dockerName -t -d \
     -v $PWD:/mnt \
     $dockerTag
