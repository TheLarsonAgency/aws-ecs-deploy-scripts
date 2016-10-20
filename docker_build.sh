#!/bin/bash

docker build -t $APP_NAME .
docker tag $APP_NAME:latest "$DOCKER_URI"

exit 0
