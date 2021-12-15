#!/bin/bash

action=$(echo close | rofi -dmenu -i -p "Your timestamp")

function run() {
  response=$($HOME/Sources/dotfiles/scripts/epochtohuman.py ${1})

  notify-send -u low -a EpochToHuman "$response"
}

run $action 0
