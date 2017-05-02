#!/bin/bash

cd /tmp
#Build last docker version. Based on: http://blog.alexellis.io/mutli-stage-docker-builds/#howcanitryitout
git clone https://github.com/docker/docker 
cd docker
make tgz

docker run -v `pwd`/bundles:/go/src/github.com/docker/docker/bundles --privileged -ti docker-dev:master bash -c "export PATH=$PATH:`pwd`/bundles/latest/dynbinary-daemon:`pwd`/bundles/latest/binary-client/;dockerd &;git clone https://github.com/sapk-fork/gitea;cd gitea;git checkout multi-stage-docker;make docker-multi-update-all"
