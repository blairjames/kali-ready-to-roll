#!/usr/bin/env bash

configure() {
  local -r path
  local -r image_name
  path=/$HOME/docker/kali
  image_name=docker.io/blairy/kali-ready-to-roll
}

build() {
  local path
  local image_name
  path=$1
  image_name=$2
  readonly path
  readonly image_name
  sudo docker build --pull -t $image_name:latest $path --progress=plain 2>&1 | tee $path/build.log
}

except() {
  local message
  message=$1
  readonly message
  printf "Error! - " + $message
    + "\nBuild process will now exit."
  exit 1
}

main() {
  configure || except "Failed to configure the image name and path." 
  build || except "Docker Build Failed, see journalctl and build.log for more information."
}

main
