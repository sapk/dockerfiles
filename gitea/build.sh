#!/bin/bash

git clone https://github.com/go-gitea/gitea --depth 10
cd gitea
git fetch origin pull/3958/head:docker-multiarch 
git checkout docker-multiarch

TARGET=amd64 GOARCH=amd64 QEMU_ARCH=amd64 make docker-cross
TARGET=arm64v8 GOARCH=arm64 QEMU_ARCH=aarch64 make docker-cross
TARGET=arm32v6 GOARCH=arm QEMU_ARCH=arm make docker-cross

docker push sapk/gitea:latest-linux-amd64 
docker push sapk/gitea:latest-linux-arm 
docker push sapk/gitea:latest-linux-arm64 
