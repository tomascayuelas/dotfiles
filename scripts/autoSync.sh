#!/bin/bash

localPath="/home/tomascayuelas/Development/Sources/Own/poupermo-api/"
remotePath="/home/tomascayuelas/Development/Sources/Own/poupermo-api/"

while true; do
    rsync -azvu --delete gdevel:$remotePath $localPath
    sleep 120
done