#!/usr/bin/env bash

pkill polybar

echo "---" | tee -a /tmp/polybar_main.log
# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

PRIMARY=$(xrandr --listactivemonitors | grep -i "+\*" | awk '{print $4}')
herbstclient pad 0 27 0 0 0
herbstclient pad 1 27 0 0 0
herbstclient pad 2 27 0 0 0
MONITOR=$PRIMARY polybar -c $HOME/.config/polybar/config main >>/tmp/polybar_main.log 2>&1 & disown
MONITOR=DP2 polybar -c $HOME/.config/polybar/config main >>/tmp/polybar_main.log 2>&1 & disown
MONITOR=DP1-9 polybar -c $HOME/.config/polybar/config main >>/tmp/polybar_main.log 2>&1 & disown
