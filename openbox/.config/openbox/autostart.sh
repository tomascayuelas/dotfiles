#!/bin/bash
xset b off &
xset r rate 250 25 &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

sh $HOME/.config/polybar/launch.sh &
nitrogen --restore &
dunst -c $HOME/.config/dunst/dunstrc &
nm-applet &
blueman-applet &
pasystray &
flameshot &
sh $HOME/.screenlayout/work-home.sh &
picom --config $HOME/.config/picom/picom.conf &
