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
  path="$1"
  image_name="$2"
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
  docker build --pull -t "${image_name}" "${path}" 2>&1 | tee "${path}"/build.log 
}

push() {
  local name
  name="$1"
  readonly name
  docker push "${name}"
}

main() {
  local path
  local name
  path="${USERHOME}"/docker/kali
  name="docker.io/blairy/kali-ready-to-roll"
  readonly path
  readonly name
  configure "${path}" "${name}" || except "Failed to configure the image name and path." 
  push "${name}" || except "Failed to push image to Docker hub"
}

main "$@"
