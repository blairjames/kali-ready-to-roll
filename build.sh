#!/usr/bin/env bash

docker build . -t blairy/kali_patched || echo 'Docker Build Failed!' 

git="/usr/bin/git -C /home/docker/kali_patched_docker"

$git pull git@github.com:blairjames/kali_patched_docker.git || echo 'Pull Failed!'
$git add --all || echo 'Add Failed!'
$git commit -a -m 'Automatic build '$timestp || echo 'Commit Failed!'
$git push || echo 'Push Failed!'

