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

# screen sleep 5min
xset dpms 300 

# start ssh-agent with X so agent is accessible
eval $(ssh-agent)

#exec awesome -c $HOME/.config/awesome/rc.lua
#exec qtile start -c $HOME/.config/qtile/config.py
#exec herbstluftwm -c $HOME/.config/herbstluftwm/autostart
#exec startxfce4
exec xmonad
