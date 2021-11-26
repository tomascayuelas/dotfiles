#!/bin/bash

if [$WHEREIAM == "laptop"]; then
  sh $HOME/.screenlayout/alone-in-the-dark.sh &
elif [$WHEREIAM == "desktop"]; then
  sh $HOME/.screenlayout/work-home.sh &
fi

nitrogen --restore &
dunst -c $HOME/.config/dunst/dunstrc &
nm-applet &
blueman-applet &
pasystray &
flameshot &
