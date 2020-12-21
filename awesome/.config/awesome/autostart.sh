#!/usr/bin/env bash

function run()
{
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run picom --config $HOME/.config/picom/picom.conf
run $HOME/.screenlayout/work-home.sh
run nitrogen --restore
run lxsession
#run dunst
run nm-applet
run pasystray
run blueman-applet
run flameshot

