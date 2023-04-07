#!/usr/bin/env bash

except() {
  local message
  message="$1"
  readonly message
  printf "Error! - " + "${message}"
    + "\nBuild process will now exit."
  exit 1
}

configure() {
  local path
  local image_name
  path="${USERHOME}"/docker/kali
  image_name=docker.io/blairy/kali-ready-to-roll
  readonly path
  readonly image_name
  build "${path}" "${image_name}" || except "Docker Build Failed, see journalctl and build.log for more information."
}

build() {
  local path
  local image_name
  path="$1"
  image_name="$2"
  readonly path
  readonly image_name
  sudo docker build --pull -t "${image_name}":latest "${path}" 2>&1 | tee "${path}"/build.log 
}

main() {
  configure || except "Failed to configure the image name and path." 
}

main "$@"
