#!/usr/bin/env bash

source /root/.ssh/agent/root || . /root/.ssh/agent/root

echo $(date) > /home/docker/kali_patched_docker/log.build

timestamp () {
    date +"%Y%m%d_%H%M%S"
}

docker build . -t blairy/kali_patched:$(timestamp) || echo 'Docker Build Failed!' 

git="/usr/bin/git -C /home/docker/kali_patched_docker"

$git pull git@github.com:blairjames/kali_patched_docker.git || echo 'Pull Failed!'
$git add --all || echo 'Add Failed!'
$git commit -a -m 'Automatic build '$timestp || echo 'Commit Failed!'
$git push || echo 'Push Failed!'
