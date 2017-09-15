#!/usr/bin/env bash

sleepTimeInSeconds=120
localPath=$1
remotePath=$2

while true; do
    rsync -azvu --delete gdevel:$remotePath $localPath
    sleep $sleepTimeInSeconds
done