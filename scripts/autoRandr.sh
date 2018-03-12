#!/bin/bash

screenFirst=eDP1
screenSecond=DP2
startDelayInSeconds=5

renice +19 $$ >/dev/null

sleep $startDelayInSeconds

oldDual="dummy"

while [ 1 ]; do
    dualIsConnected=$(cat /sys/class/drm/card0-HDMI-A-2/status)
echo $dualIsConnected ."\n"

echo $oldDual . "\n"
    if [ "$oldDual" != "$dualIsConnected" ]; then
        if [ "$dualIsConnected" == "connected" ]; then
		echo "entro is connected"
	    sh ~/.screenlayout/letgo-desk.sh
        else
		echo "entro no conected"
	    xrandr --auto
        fi

        oldDual=$dualIsConnected
    fi

    inotifywait -q -e close /sys/class/drm/card0-HDMI-A-2/status >/dev/null
done
