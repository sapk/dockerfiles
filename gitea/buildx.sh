#!/bin/bash

#Setup buildx
export DOCKER_CLI_EXPERIMENTAL=enabled
export DOCKER_BUILDKIT=1
docker build --platform=local -o . git://github.com/docker/buildx
mv buildx ~/.docker/cli-plugins/docker-buildx

#Setup gitea
git clone https://github.com/go-gitea/gitea --depth 10
cd gitea

#Building
docker buildx build --push --platform=linux/amd64,linux/arm64,linux/arm/v6 .
