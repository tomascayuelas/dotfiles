from typing import List  # noqa: F401

import os
import subprocess
from libqtile import hook
from groups import groups # NOQA
from screens import screens # NOQA
from layouts import layouts # NOQA
from keys import keys, mouse # NOQA


# Configuration variables
# https://docs.qtile.org/en/latest/manual/config/index.html#configuration-variables
auto_fullscreen = False
bring_front_click = False
cursor_warp = False
dgroups_key_binder = None
dgroups_app_rules = []  # type: List
focus_on_window_activation = "focus"
follow_mouse_focus = True

widget_defaults = dict(
    font='sans',
    fontsize=14,
    padding=3,
)
extension_defaults = widget_defaults.copy()

reconfigure_screen = True
wmname = "LG3D"


@hook.subscribe.startup_once
def start_once():
    subprocess.call([os.path.expanduser('~') + '/.config/qtile/autostart.sh'])
