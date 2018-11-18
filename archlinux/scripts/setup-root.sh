#!/bin/bash
#
# setup-root: Simplified version of https://raw.githubusercontent.com/tokland/arch-bootstrap/master/arch-bootstrap.sh and https://wiki.archlinux.org/index.php/offline_installation_of_packages
#
# depends on : pacman curl sed tar awk sort
# optional: xz
# 
PACKAGES=(readline ncurses acl archlinux-keyring attr bzip2 curl expat glibc gpgme libarchive libassuan libgpg-error libnghttp2 libssh2 lzo openssl pacman pacman-mirrorlist xz zlib krb5 e2fsprogs keyutils libidn2 libunistring gcc-libs lz4 libpsl icu zstd filesystem coreutils bash grep gawk file tar sed ca-certificates-mozilla ca-certificates-utils ca-certificates findutils)
#PACKAGES_TO_INSTALL=(ca-certificates readline ncurses acl archlinux-keyring attr bzip2 curl expat glibc gpgme libarchive libassuan libgpg-error libnghttp2 libssh2 lzo openssl pacman pacman-mirrorlist xz zlib krb5 e2fsprogs keyutils libidn2 libpsl icu filesystem coreutils bash grep gawk file sed tar)

#Env config
BASE=${BASE:-'./'}
ARCH=${ARCH:-'x86_64'}
REPO=${REPO:-"https://mirrors.kernel.org/archlinux/\$repo/os/${ARCH}"}

#For arm base
#BASE=${BASE:-'./'}
#ARCH=${ARCH:-'arm'} #arm aarch64 armv6h armv7h   
#REPO=${REPO:-"http://mirror.archlinuxarm.org/${ARCH}/\$repo"}
set -e -u -o pipefail


get_db_file() { 
    local DB=$1
    local URL=$(get_repo_url $DB)

    mkdir -p "${BASE}/var/lib/pacman/sync"
    curl -s -L -o "${BASE}/var/lib/pacman/sync/${DB}.db" "${URL}/${DB}.db"
}

get_repo_url() {
    echo "${REPO/\$repo/$1}"
}

get_core_repo_url() {
    echo $(get_repo_url "core")
}

generate_pacman_config() { 
    mkdir -p "${BASE}/etc/pacman.d"
    cp "/etc/resolv.conf" "$BASE/etc/resolv.conf"
    echo "Server = $REPO" > "$BASE/etc/pacman.d/mirrorlist"
    sed -i "s/^[[:space:]]*\(CheckSpace\)/# \1/" "$BASE/etc/pacman.conf"
    sed -i "s/^[[:space:]]*SigLevel[[:space:]]*=.*$/SigLevel = Never/" "$BASE/etc/pacman.conf"
    #TODO setup host
    mkdir -p "$BASE/dev"
    touch "$BASE/etc/group"
    echo "bootstrap" > "$BASE/etc/hostname"
    #echo 'en_US.UTF-8 UTF-8' > "$BASE/etc/locale.gen"
}


fetch_packages_list() {
  local REPO=$1
  curl -L -s "$REPO/" | sed -n '/<a / s/^.*<a [^>]*href="\([^\"]*\)".*$/\1/p' | awk -F"/" '{print $NF}' | sort -rn
}

uncompress() {
  local FILEPATH=$1  
  case "$FILEPATH" in
    *.gz) 
      tar xzf "$FILEPATH" -C "$BASE" &> /dev/null;;
    *.xz) 
      xz -dc "$FILEPATH" | tar x -C "$BASE" &> /dev/null;;
  esac
}  

install_manual() {
    local PACKAGE=$1
    local REPO=$(get_core_repo_url)
    local LIST=$(fetch_packages_list $REPO)
    local FILE=$(echo "$LIST" | grep -m1 "^$PACKAGE-[[:digit:]].*\(\.gz\|\.xz\)$")
    local FILEPATH="$BASE/var/cache/pacman/pkg/$FILE"
    mkdir -p "${BASE}/var/cache/pacman/pkg"

    echo "Downloading $PACKAGE ..."
    curl -s -L -o "$FILEPATH" "$REPO/$FILE"
    echo "Unpacking $PACKAGE ..."
    uncompress "$FILEPATH"
}

clean() {
    rm -r $BASE/var/cache/pacman/pkg/* $BASE/usr/share/man/* $BASE/usr/share/doc/*
    ls -d $BASE/usr/share/locale/* | egrep -v "en_U|alias" | xargs rm -rf
    rm $BASE/.{INSTALL,MTREE,PKGINFO,BUILDINFO}
    find $BASE/ -regextype posix-extended -regex ".+\.pac(new|save)" -delete
}

main() {
    #for PACKAGE in "filesystem" "pacman" "archlinux-keyring"; do
    for PACKAGE in "${PACKAGES[@]}"; do
         install_manual "$PACKAGE"
    done

    generate_pacman_config
    for DB in "core" "community" "extra" "multilib" "alarm" "aur" ; do
        get_db_file $DB
    done

    #Reinstall via pacman to populate databases
    sed -i "s/^#XferCommand[[:space:]]*=.*$/XferCommand = \/usr\/bin\/true/" "$BASE/etc/pacman.conf"
    for PACKAGE in "${PACKAGES[@]}"; do
         pacman --sysroot $BASE --arch $ARCH --noconfirm -dd --overwrite "*" -S "$PACKAGE" || true
    done
    #pacman --sysroot $BASE --arch $ARCH --noconfirm -dd --overwrite "*" -S libunistring gcc-libs lz4 zstd 
    #pacman --sysroot $BASE --arch $ARCH --noconfirm -dd --dbonly --overwrite "*" -S libunistring gcc-libs lz4 zstd 
    sed -i "s/^XferCommand = \/usr\/bin\/true$//" "$BASE/etc/pacman.conf"

    clean
}

main "$@"