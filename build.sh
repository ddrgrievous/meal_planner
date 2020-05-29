#!/bin/bash

export CONTAINER=`docker ps | sed 1d | awk '{print $1}'`
echo $CONTAINER
docker container stop $CONTAINER
docker container rm $CONTAINER
docker build -t example/ubuntu-flask-gunicorn-docker:latest .
docker run --shm-size=256m --detach -p 80:8080 example/ubuntu-flask-gunicorn-docker:latest
google-chrome http://localhost