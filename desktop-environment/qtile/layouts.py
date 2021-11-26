from libqtile import layout
from libqtile.config import Match

scheme = {
    "border_focus": "95CEFE",
    "border_normal": "952020"
}

layouts = [
    layout.Columns(margin=5, border_width=2, border_focus=scheme["border_focus"], num_columns=3),
    layout.MonadTall(margin=5, border_width=2, border_focus=scheme["border_focus"]),
    layout.MonadWide(margin=5, border_width=2, border_focus=scheme["border_focus"]),
    layout.Stack(stacks=2),
    layout.Floating(),
    layout.Max(),
]

floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'), 
    Match(wm_class='makebranch'), 
    Match(wm_class='maketag'), 
    Match(wm_class='ssh-askpass'), 
    Match(wm_class='zoom'),
    Match(title='branchdialog'), 
    Match(title='pinentry'),
])
