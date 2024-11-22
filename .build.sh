#!/bin/bash
# build the docker image
docker build -t devops-react-app .

# tag the image
docker tag devops-react-app:latest kishorekannan23/dev:dev


# push the image to docker hub
docker push kishorekannan23/dev:dev
