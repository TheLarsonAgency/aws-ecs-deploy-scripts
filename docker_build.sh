#!/bin/bash

docker build -t $APP_NAME .
docker tag larsonagency-website:latest $DOCKER_URI

exit 0
