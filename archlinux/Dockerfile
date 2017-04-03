FROM base/archlinux

#Inspired from https://github.com/finalduty/docker-archlinux/blob/master/mkdocker-archlinux.sh
ENV ROOTFS="/tmp/archroot" PKGIGNORE="cryptsetup device-mapper dhcpcd gcc-go iproute2 jfsutils linux lvm2 man-db man-pages mdadm netctl openresolv pciutils pcmciautils reiserfsprogs s-nail systemd-sysvcompat usbutils nano vi xfsprogs"

RUN pacstrap -c -d -G -i $ROOTFS base haveged $PACMAN_EXTRA_PKGS --ignore $PKGIGNORE

FROM scratch 
LABEL maintainer Antoine GIRARD <antoine.girard@sapk.fr>

COPY --from=builder /tmp/archroot /
SHELL ["/bin/sh", "-c"]

#RUN pacman -Syu --noconfirm -; pacman -Scc --noconfirm; rm -r /usr/share/man/*; rm -r /usr/share/locale/* 
#ONBUILD RUN pacman -Syu --noconfirm -; pacman -Scc --noconfirm; rm -r /usr/share/man/*; rm -r /usr/share/locale/* 
CMD /bin/bash
