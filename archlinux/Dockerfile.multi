FROM sapk/archlinux AS builder
#As backup plan FROM sapk/archlinux:root.x86_64 AS builder

ARG ARCH="arm"
ARG REPO="http://mirror.archlinuxarm.org/arm/\$repo"
ARG QEMU_ARCH="arm"
ARG QEMU_VERSION="v4.0.0"

#setup before docker run --rm --privileged multiarch/qemu-user-static:register --reset
# Qemu binaries
RUN curl -o /usr/bin/qemu-$QEMU_ARCH-static -sL https://github.com/multiarch/qemu-user-static/releases/download/$QEMU_VERSION/qemu-$QEMU_ARCH-static \
 && chmod +x /usr/bin/qemu-$QEMU_ARCH-static

#Deps
RUN pacman -Syu --overwrite '*' --noconfirm tar || echo "ignore error"

#Setup root
ADD ./scripts/setup-root.sh setup-root.sh
RUN BASE=/root.arch ./setup-root.sh \
 && cp -a /usr/bin/qemu-$QEMU_ARCH-static /root.arch/usr/bin/qemu-$QEMU_ARCH-static
 
FROM scratch
LABEL maintainer Antoine GIRARD <antoine.girard@sapk.fr>

COPY --from=builder /root.arch/ /
#ENTRYPOINT ["/bin/bash"] 

#ONBUILD RUN pacman -Syu --noconfirm -; pacman -Scc --noconfirm; rm -r /usr/share/man/*; rm -r /usr/share/locale/* 
