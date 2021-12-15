#!/bin/bash

interval=$1

while [ 0 -lt 1 ]; do
    notify-send --urgency=critical "DRINK WATER, RIGHT NOW!";
    sleep $interval
done
