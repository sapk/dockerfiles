FROM base/archlinux

#Inspired from https://github.com/finalduty/docker-archlinux/blob/master/mkdocker-archlinux.sh
ENV ROOTFS="/tmp/archroot" PKGS="filesystem bash coreutils file findutils gettext bzip2 glibc grep gzip inetutils iproute2 iputils less licenses pacman pciutils perl shadow sed sysfsutils tar texinfo which"

RUN mkdir -p $ROOTFS \
 && pacman -Syu --noconfirm \
 && pacstrap -c -d -G $ROOTFS $PKGS $PACMAN_EXTRA_PKGS

FROM scratch 
LABEL maintainer Antoine GIRARD <antoine.girard@sapk.fr>

COPY --from=builder /tmp/archroot /
SHELL ["/bin/sh", "-c"]

#RUN pacman -Syu --noconfirm -; pacman -Scc --noconfirm; rm -r /usr/share/man/*; rm -r /usr/share/locale/* 
#ONBUILD RUN pacman -Syu --noconfirm -; pacman -Scc --noconfirm; rm -r /usr/share/man/*; rm -r /usr/share/locale/* 
CMD /bin/bash
