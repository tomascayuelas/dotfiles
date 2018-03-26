import logging

from i3pystatus import Status

from i3pystatus.updates import pacman, cower
from i3pystatus import github

status = Status()

## CAL -----------------------------------------------------------------
status.register("clock",
    format=" %X@%d-%m",
    color='#CCCCCC',
    interval=1,
    on_leftclick="zenity --calendar --text ''",
)

# The battery monitor has many formatting options, see README for details
# show battery status
status.register("battery",
    format="{status} {percentage:.0f}%[ {remaining}]",
    color='#CCCCCC',
    alert_percentage=10,
    not_present_text="ON POWER ",
    status={
        "CHR": "",
        "DPL": "",
        "DIS": "",
        "FULL": "",
    },
)

# Shows pulseaudio default sink volume
#
# Note: requires libpulseaudio from PyPI
status.register("pulseaudio",
    format_muted=" {muted}",
    format=" {volume}%",
    color_muted='#CCCCCC',
    color_unmuted='#CCCCCC',
)

# Backlight
status.register("backlight",
    interval=5,
    format=" {percentage:.0f}%",
    color='#CCCCCC',
    backlight="intel_backlight",
)

status.register("shell",
    command="setxkbmap -query | awk -F ': *' '/layout/ { print toupper($2) }'",
    interval=5,
    format=" {output}",
    color='#CCCCCC',
)

# Shows the average load of the last minute and the last 5 minutes
# (the default value for format is used)
status.register(
    "load",
    format=" {avg1}/{avg5}",
    color='#CCCCCC',
)

# Show memory available system
status.register("mem",
    color='#CCCCCC',
    warn_color="#E5E500",
    alert_color="#FF1919",
    format=" {avail_mem}GB",
    divisor=1073741824,
)

# Shows your CPU temperature, if you have a Intel CPU
status.register("temp",
    format=" {temp:.0f}°C",
    color='#CCCCCC',
)

# show updates in pacman/aur
status.register(
    "updates",
    format=" {Pacman}P/{Cower}A",
    backends=[pacman.Pacman(), cower.Cower()],
    color='#CCCCCC',
)
 
# Network - Wired
status.register("network",
    interface="enp0s25",
    format_down=" off",
    format_up=" {v4}",
    color_down='#CCCCCC',
    color_up='#CCCCCC',
)

# Network - Wireless
status.register("network",
    interface="wlp3s0",
    format_down=" off",
    format_up=" {v4}",
    color_up='#CCCCCC',
    color_down='#CCCCCC',
)

# Shows disk usage of /
status.register("disk",
    path="/",
    format=" {avail}G",
    color='#CCCCCC',
)

# Shows mpd status
# Format:
# Cloud connected▶Reroute to Remain
status.register("mpd",
    format="{title}{status}{album}",
    status={
        "pause": "▷",
        "play": "▶",
        "stop": "◾",
    },
    color='#CCCCCC',
)

status.run()