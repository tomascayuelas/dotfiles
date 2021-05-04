#!/usr/bin/env bash

function run_once()
{
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run_once $HOME/.screenlayout/work-home-three.sh
run_once picom --config $HOME/.config/picom/picom.conf
run_once nitrogen --restore
run_once lxsession
#run_once dunst
run_once nm-applet
run_once pasystray
run_once cbatticon
run_once blueman-applet
run_once flameshot

