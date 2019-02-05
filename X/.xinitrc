[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

if test -z "$DBUS_SESSION_BUS_ADDRESS"; then
  eval $(dbus-launch --sh-syntax --exit-with-session)
  export $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gnupg)
fi

export DOTFILES_PATH="/home/tomascayuelas/Development/Own/dotfiles"

#exec compton -cCGb &
exec i3
