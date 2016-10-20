#! /bin/bash

docker build -t librarian .
docker run -d -P librarian
sleep 5
docker logs $(docker -lq)
