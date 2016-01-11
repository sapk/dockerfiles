#!/bin/bash
#Based on https://wiki.ubuntu.com/Mirrors/Scripts for archive

# Find a source mirror near you which supports rsync on
# https://launchpad.net/ubuntu/+archivemirrors
# rsync://<iso-country-code>.rsync.archive.ubuntu.com/ubuntu should always work
RSYNCSOURCE=${RSYNCSOURCE:-"rsync://rsync.archive.ubuntu.com/ubuntu"}
  
# Define where you want the mirror-data to be on your mirror
BASEDIR=${BASEDIR:-"/var/www/ubuntuarchive/"}
  
fatal() {
  echo "$1"
  exit 1
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
  
  sleep 3h
  sync_archive
}

darkhttpd ${BASEDIR} --port 8080 --chroot & 

sync_$SYNCMODE

