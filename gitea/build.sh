#!/bin/bash

git clone https://github.com/go-gitea/gitea --depth 10
cd gitea
git fetch origin pull/3958/head:docker-multiarch 
git checkout docker-multiarch

DOCKER_IMAGE=sapk/gitea make docker-multi-arch-push-manifest

GOARCH=amd64 QEMU_ARCH=amd64 make docker-generate-arch-dockerfile docker-download-qemu-binary
GOARCH=arm QEMU_ARCH=arm make docker-generate-arch-dockerfile docker-download-qemu-binary
GOARCH=arm64 QEMU_ARCH=aarch64 make docker-generate-arch-dockerfile docker-download-qemu-binary

TARGET=amd64 docker build -f docker/Dockerfile.amd64 -t sapk/gitea:latest-linux-amd64 .
TARGET=arm32v6 docker build -f docker/Dockerfile.arm -t sapk/gitea:latest-linux-arm .
TARGET=arm64v8 docker build -f docker/Dockerfile.aarch64 -t sapk/gitea:latest-linux-arm64 .

docker push apk/gitea:latest-linux-amd64 
docker push apk/gitea:latest-linux-arm 
docker push apk/gitea:latest-linux-arm64 
