#!/bin/bash
#Based on https://wiki.ubuntu.com/Mirrors/Scripts for archive

fatal() {
  echo "$1"
  exit 1
}

warn() {
  echo "$1"
}

sync_releases() {
  rsync --verbose --recursive --times --links --hard-links \
  --stats --delete-after \
  ${RSYNCSOURCE} ${BASEDIR} || fatal "Failed to rsync from ${RSYNCSOURCE}."
  
  date -u > ${BASEDIR}/.trace/$(hostname -f)
  sleep 3h
  sync_releases
}

sync_archive() {
  rsync --recursive --times --links --hard-links \
    --stats \
    --exclude "Packages*" --exclude "Sources*" \
    --exclude "Release*" \
    ${RSYNCSOURCE} ${BASEDIR} || fatal "First stage of sync failed."
  
  rsync --recursive --times --links --hard-links \
    --stats --delete --delete-after \
    ${RSYNCSOURCE} ${BASEDIR} || fatal "Second stage of sync failed."
  
  date -u > ${BASEDIR}/project/trace/$(hostname -f)
  du -h -s > ${BASEDIR}/.statistics

  sleep 3h
  sync_archive
}

if [ ! -d ${BASEDIR} ]; then
  warn "${BASEDIR} does not exist yet, trying to create it..."
  mkdir -p ${BASEDIR} || fatal "Creation of ${BASEDIR} failed."
fi

darkhttpd ${BASEDIR} --port 8080 & 

sync_$SYNCMODE

