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

DOCKER_PUSHIMAGE=sapk/gitea make docker-multi-update-all
