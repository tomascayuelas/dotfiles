#!/bin/bash

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# cursor
xsetroot -cursor_name left_ptr

# screen sleep
xset dpms 600 

# start ssh-agent with X so agent is accessible
eval $(ssh-agent)

#exec awesome -c $HOME/.config/awesome/rc.lua
#exec herbstluftwm -c $HOME/.config/herbstluftwm/autostart
#exec spectrwm -c $HOME/.config/spectrwm/spectrwm.conf
#exec startxfce4
#exec xmonad
#exec qtile start -c $HOME/.config/qtile/config.py
exec startplasma-x11 
