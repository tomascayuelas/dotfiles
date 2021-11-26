#!/usr/bin/env bash

pkill polybar

echo "---" | tee -a /tmp/polybar_main.log
# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

LEFT="DP2"
PRIMARY=$(xrandr --listactivemonitors | grep -i "+\*" | awk '{print $4}')
RIGHT="DP1-9"

if [ -n "$PRIMARY" ]; then
  herbstclient pad 0 27 0 0 0
  MONITOR=$PRIMARY polybar -c $HOME/.config/polybar/config main >>/tmp/polybar_main.log 2>&1 & disown
  notify-send -u low "POLYBAR" "Primary polybar launched at $PRIMARY monitor"
fi

if [ -n "$LEFT" ]; then
  herbstclient pad 1 27 0 0 0
  MONITOR=$LEFT polybar -c $HOME/.config/polybar/config extra >>/tmp/polybar_extra.log 2>&1 & disown
  notify-send -u low "POLYBAR" "Left polybar launched at $LEFT monitor"
fi

if [ -n "$RIGHT" ]; then
  herbstclient pad 2 27 0 0 0
  MONITOR=$RIGHT polybar -c $HOME/.config/polybar/config extra >>/tmp/polybar_extra.log 2>&1 & disown
  notify-send -u low "POLYBAR" "Right polybar launched at $RIGHT monitor"
fi
