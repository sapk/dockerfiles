#!/bin/bash
#
# setup-root: Simplified version of https://raw.githubusercontent.com/tokland/arch-bootstrap/master/arch-bootstrap.sh and https://wiki.archlinux.org/index.php/offline_installation_of_packages
#
# depends on : pacman curl sed tar awk sort
# optional: xz
# 

#Env config
BASE=${BASE:-'./'}
ARCH=${ARCH:-'x86_64'}
REPO=${REPO:-"https://mirrors.kernel.org/archlinux/\$repo/os/${ARCH}"}

#For arm base
#BASE=${BASE:-'./'}
#ARCH=${ARCH:-'arm'} #arm aarch64 armv6h armv7h   
#REPO=${REPO:-"http://mirror.archlinuxarm.org/${ARCH}/\$repo"}
set -e -u -o pipefail

# Packages needed by pacman (see get-pacman-dependencies.sh)
#BASIC_PACKAGES=(${PACMAN_PACKAGES[*]} filesystem)   


get_db_file() { 
    local DB=$1
    local URL=$(get_repo_url $DB)

    mkdir -p "${BASE}/var/lib/pacman/sync"
    curl -L -o "${BASE}/var/lib/pacman/sync/${DB}.db" "${URL}/${DB}.db"
}

get_repo_url() {
    echo "${REPO/\$repo/$1}"
}

get_core_repo_url() {
    echo $(get_repo_url "core")
}

#get_core_db() { 
#    get_db_file "core" get_core_repo_url
#}

generate_pacman_config() { 
    mkdir -p "${BASE}/etc/pacman.d"
    cp "/etc/resolv.conf" "$BASE/etc/resolv.conf"
    echo "Server = $REPO" > "$BASE/etc/pacman.d/mirrorlist"
    sed -i "s/^[[:space:]]*\(CheckSpace\)/# \1/" "$BASE/etc/pacman.conf"
    sed -i "s/^[[:space:]]*SigLevel[[:space:]]*=.*$/SigLevel = Never/" "$BASE/etc/pacman.conf"

    mkdir -p "$BASE/dev"
    touch "$BASE/etc/group"
    echo "bootstrap" > "$BASE/etc/hostname"
}

fetch() {
  curl -L -s "$@"
}

fetch_file() {
  local FILEPATH=$1
  curl -L -o "$FILEPATH" "$@"
}

fetch_packages_list() {
  local REPO=$1
  fetch "$REPO/" | sed -n '/<a / s/^.*<a [^>]*href="\([^\"]*\)".*$/\1/p' | awk -F"/" '{print $NF}' | sort -rn
}

uncompress() {
  local FILEPATH=$1  
  case "$FILEPATH" in
    *.gz) 
      tar xzf "$FILEPATH" -C "$BASE";;
    *.xz) 
      xz -dc "$FILEPATH" | tar x -C "$BASE";;
  esac
}  

install_manual() {
    local PACKAGE=$1
    local REPO=$(get_core_repo_url)
    local LIST=$(fetch_packages_list $REPO)
    local FILE=$(echo "$LIST" | grep -m1 "^$PACKAGE-[[:digit:]].*\(\.gz\|\.xz\)$")
    local FILEPATH="$BASE/var/cache/pacman/pkg/$FILE"
    mkdir -p "${BASE}/var/cache/pacman/pkg"

    curl -L -o "$FILEPATH" "$REPO/$FILE"
    uncompress "$FILEPATH"
}

main() {
    #install_pacman_packages "${BASIC_PACKAGES[*]}" "$BASE" "$LIST" "$DOWNLOAD_DIR"

    for PACKAGE in "filesystem" "pacman" "archlinux-keyring" "base"; do
        install_manual $PACKAGE
    done

    generate_pacman_config
    for DB in "core" "community" "extra" "multilib" "alarm" "aur" ; do
        get_db_file $DB
    done

    pacman --sysroot ${BASE} --arch ${ARCH} -S --noconfirm filesystem pacman
}

main "$@"