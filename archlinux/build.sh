#!/bin/bash

docker build --build-arg ARCH="arm" --build-arg QEMU_ARCH="arm" --build-arg REPO="http://mirror.archlinuxarm.org/arm/\$repo" -f Dockerfile.multi -t sapk/archlinux:arm .
docker push sapk/archlinux:arm
docker build --build-arg ARCH="armv6h" --build-arg QEMU_ARCH="arm" --build-arg REPO="http://mirror.archlinuxarm.org/armv6h/\$repo"  -f Dockerfile.multi -t sapk/archlinux:armv6h .
docker push sapk/archlinux:armv6h
docker build --build-arg ARCH="armv7h" --build-arg QEMU_ARCH="arm" --build-arg REPO="http://mirror.archlinuxarm.org/armv7h/\$repo"  -f Dockerfile.multi -t sapk/archlinux:armv7h .
docker push sapk/archlinux:armv7h
docker build --build-arg ARCH="aarch64" --build-arg QEMU_ARCH="aarch64" --build-arg REPO="http://mirror.archlinuxarm.org/aarch64/\$repo" -f Dockerfile.multi -t sapk/archlinux:aarch64 .
docker push sapk/archlinux:aarch64
docker build --build-arg ARCH="x86_64" --build-arg QEMU_ARCH="x86_64" --build-arg REPO="https://mirrors.kernel.org/archlinux/\$repo/os/x86_64"  -f Dockerfile.multi -t sapk/archlinux:x86_64 .
docker push sapk/archlinux:x86_64
docker build --build-arg ARCH="i686" --build-arg QEMU_ARCH="i386" --build-arg REPO="https://mirror.archlinux32.org/i686/\$repo"  -f Dockerfile.multi -t sapk/archlinux:i686 .
docker push sapk/archlinux:i686
