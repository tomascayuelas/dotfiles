#!/bin/bash

action=$(echo close | rofi -dmenu -i -p "Date (Y M D h m s): ")

function run() {
  unixtimestamp=$(unixtimestamp ${1} ${2} ${3} ${4} ${5} ${6})

  printf $unixtimestamp > /tmp/unixtimestamp.lock

  cat /tmp/unixtimestamp.lock | xclip -silent -selection clipboard

  notify-send -u low -a UnixTimeStamp "${1}-${2}-${3} ${4}:${5}:${6} to $unixtimestamp generated and copied to clipboard"
}

run $action 0
