#!/bin/bash

toKill=$1
pids=(`pgrep -f "\/${toKill}"`)

for pid in "${pids[@]}"
do
  kill -9 $pid
  echo "> Killed: $pid "
done
