#!/bin/bash


# pull the image from the docker hub
docker pull kishorekannanc/prod:prod

# stop and remove the old container
docker stop devops-react-app-container || true
docker rm devops-react-app-container || true

#run the container and port binding

docker run -d --name devops-react-app-container -p 80:80 kishorekannan23/prod:prod
