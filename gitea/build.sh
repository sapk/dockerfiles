#!/bin/bash

cd /tmp
#Build last docker version. Based on: http://blog.alexellis.io/mutli-stage-docker-builds/#howcanitryitout
#Not needed since docker as release this function
#git clone https://github.com/docker/docker 
#(cd docker && sudo make install)
#service docker restart

git clone https://github.com/sapk-fork/gitea
cd gitea
git checkout multi-stage-docker
#sed -i "s;gitea/;sapk/;g" docker/manifest/gitea*

DOCKER_PUSHIMAGE=sapk/gitea make --always-make docker-multi-amd64 
DOCKER_PUSHIMAGE=sapk/gitea make --always-make docker-multi-arm 
DOCKER_PUSHIMAGE=sapk/gitea make --always-make docker-multi-arm64
DOCKER_MANIFEST=docker/manifest/gitea.yml DOCKER_PUSHIMAGE=sapk/gitea make --always-make docker-multi-update-manifest

#GITEA_VERSION=v1.1.1 DOCKER_PUSHIMAGE=sapk/gitea make -B docker-multi-amd64 docker-multi-arm docker-multi-arm64
#DOCKER_MANIFEST=docker/manifest/gitea-1-1-1.yml DOCKER_PUSHIMAGE=sapk/gitea make -B docker-multi-update-manifest

#GITEA_VERSION=v1.1.0 DOCKER_PUSHIMAGE=sapk/gitea make docker-multi-update-all
#GITEA_VERSION=v1.0.2 DOCKER_PUSHIMAGE=sapk/gitea make docker-multi-update-all
#GITEA_VERSION=v1.0.1 DOCKER_PUSHIMAGE=sapk/gitea make docker-multi-update-all
#GITEA_VERSION=v1.0.1 DOCKER_PUSHIMAGE=sapk/gitea make docker-multi-update-all


#GITEA_VERSION=release/v1.1 DOCKER_PUSHIMAGE=sapk/gitea make docker-multi-update-all
#GITEA_VERSION=release/v1.0 DOCKER_PUSHIMAGE=sapk/gitea make docker-multi-update-all
