[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

exec compton  &
exec urxvtd --quiet --opendisplay --fork &
exec i3
