from typing import List  # noqa: F401
from libqtile.config import Screen
from libqtile import bar, widget

def main_bar(visible_groups: List[str]):
    return bar.Bar(
        [
            widget.GroupBox(fontsize=12, visible_groups=visible_groups),
            widget.CurrentLayoutIcon(),
            widget.WindowName(),
            widget.Systray(),
            widget.Clock(format='%d-%m-%Y - %H:%M:%S'),
            widget.QuickExit(),
        ],
        28,
    )


screens = [
    Screen(top=main_bar(['1', '2', '3', '4', '5', '6']))
]
