#!/usr/bin/env bash

build() {
  local path;
  path=/$HOME/docker/kali;
  sudo docker build --pull -t docker.io/blairy/kali-ready-to-roll:latest $path --progress=plain 2>&1 | tee $path/build.log;
}

main() {
  build || exit 111;
}

main;
