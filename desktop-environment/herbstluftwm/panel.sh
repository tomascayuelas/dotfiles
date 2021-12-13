#!/usr/bin/env bash

pkill polybar

echo "---" | tee -a /tmp/polybar_main.log
# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

PRIMARY=$(xrandr --listactivemonitors | grep -i "+\*" | awk '{print $4}')

herbstclient pad 0 28 0 0 0
polybar -c $HOME/.config/polybar/config main >>/tmp/polybar_main.log 2>&1 & disown
notify-send -u low "POLYBAR" "Polybar launched at main monitor"
