#!/bin/sh
i3-nagbar -m "I3WM SCREEN CONFIG UTILITY" -t warning \
	-b "OFFICE" "xrandr --output eDP1 --mode 1600x900 --pos 136x1080 --rotate normal --output HDMI1 --mode 1920x1080 --pos 0x0 --rotate normal" \
	-b "ALONE" "xrandr --output eDP1 --mode 1600x900 --pos 136x1080 --rotate normal --output HDMI1 --off" \
sh ~/.fehbg
