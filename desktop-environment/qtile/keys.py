import os

from libqtile.config import Key, Drag, Click
from libqtile.command import lazy
from groups import groups #NOQA

mod = "mod4"
alt = "mod1"
apps = {
    "terminal": "alacritty",
    "launcher": "rofi -show run",
    "switcher": "rofi -show window"
}

home = os.path.expanduser('~')

keys = [
    # Switch between windows in current stack pane
    Key([mod], "j", lazy.layout.left()),
    Key([mod], "k", lazy.layout.down()),
    Key([mod], "l", lazy.layout.up()),
    Key([mod], "semicolon", lazy.layout.right()),

    # Move windows
    Key([mod, "shift"], "j", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "semicolon", lazy.layout.shuffle_right()),

    # Resizing
    Key([mod, "control"], "j", lazy.layout.grow_left()),
    Key([mod, "control"], "k", lazy.layout.grow_down()),
    Key([mod, "control"], "l", lazy.layout.grow_up()),
    Key([mod, "control"], "semicolon", lazy.layout.grow_right()),

    # Switch window focus to other pane(s) of stack
    Key([mod], "space", lazy.layout.next(),
        desc="Switch window focus to other pane(s) of stack"),

    Key([mod, "shift"], "space", lazy.window.toggle_floating()),
    Key([mod], "f", lazy.window.toggle_fullscreen()),

    # Custom applications
    Key([mod], "Return", lazy.spawn(apps["terminal"])),
    Key([alt], "Tab", lazy.spawn(apps["switcher"])),
    Key([mod], "d", lazy.spawn(apps["launcher"])),

    Key([mod, "shift"], "c", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "shift"], "r", lazy.restart(), desc="Restart qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown qtile"),

    # Switch focus to a physical monitor (dual/triple set up)
    Key([mod], "period", lazy.to_screen(0)),
    Key([mod], "comma", lazy.to_screen(1)),
    Key([mod], "slash", lazy.to_screen(2)),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

for group in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], group.name, lazy.group[group.name].toscreen(),
            desc="Switch to group {}".format(group.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], group.name, lazy.window.togroup(group.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(group.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])
