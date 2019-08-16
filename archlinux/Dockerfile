#Inspired by https://github.com/finalduty/docker-archlinux/blob/master/mkdocker-archlinux.sh && https://github.com/moby/moby/blob/master/contrib/mkimage-arch.sh
FROM alpine AS builder

ENV VERSION="2019.08.01" 
ENV BOOTSTRAP="https://archive.archlinux.org/iso/${VERSION}/archlinux-bootstrap-${VERSION}-x86_64.tar.gz" 

ENV PACMAN_MIRRORLIST="Server = https://mirrors.kernel.org/archlinux/\$repo/os/\$arch"
 
#ENV BOOTSTRAP="./archlinux-bootstrap-${VERSION}-x86_64.tar.gz" 
#COPY $BOOTSTRAP /bootstrap.tar.gz
ADD $BOOTSTRAP /bootstrap.tar.gz
#TODO verify sig 

WORKDIR /
RUN tar xzvf /bootstrap.tar.gz

WORKDIR /root.x86_64
RUN echo 'en_US.UTF-8 UTF-8' > ./etc/locale.gen \
 && echo $PACMAN_MIRRORLIST > ./etc/pacman.d/mirrorlist

FROM scratch AS cleaner
LABEL maintainer Antoine GIRARD <antoine.girard@sapk.fr>

COPY --from=builder /root.x86_64/ /

# TODO use haveged to generate entropy
RUN pacman-key --init \
 && pacman-key --populate archlinux \
 && pacman -Sy --noconfirm sed grep \
 && pacman -R --noconfirm arch-install-scripts \
 && pacman -Syu --noconfirm \
 && pacman -Q \
 && pacman -Scc --noconfirm \
 && rm -r /usr/share/man/* /usr/share/doc/* \
 && ls -d /usr/share/locale/* | egrep -v "en_U|alias" | xargs rm -rf
 
# && pacman -Rs --noconfirm device-mapper systemd \
# && locale-gen
#rm /usr/lib/libgo.so.13.0.0 /usr/lib/libgfortran.so.5.0.0


FROM scratch
LABEL maintainer Antoine GIRARD <antoine.girard@sapk.fr>

COPY --from=cleaner / /
ENTRYPOINT /bin/bash 

#ONBUILD RUN pacman -Syu --noconfirm -; pacman -Scc --noconfirm; rm -r /usr/share/man/*; rm -r /usr/share/locale/* 
