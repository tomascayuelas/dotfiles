#!/bin/bash

sh $HOME/.screenlayout/work-home.sh &
herbstclient detect_monitors &

dunst -c $HOME/.config/dunst/dunstrc &
nm-applet &
blueman-applet &
pasystray &
flameshot &
parcellite &
