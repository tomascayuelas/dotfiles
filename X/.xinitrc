[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

exec compton -cCGb &
exec urxvtd --quiet &
exec i3
