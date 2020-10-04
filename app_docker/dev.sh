#!/bin/bash

docker build \
--file=node.Dockerfile \
--tag=env_node:0.1 \
.

docker create \
--interactive \
--tty \
--rm \
--name=servidor_archivo \
--publish 5000:3000 \
--mount type=bind,source="$(pwd)/src",target=/home/node/src \
--workdir /home/node/src \
env_node:0.1 

docker start servidor_archivo
docker port servidor_archivo
docker attach servidor_archivo