[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

source /etc/X11/xinit/xinitrc.d/00-start-message-bus.sh

eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID

eval $(dbus-launch --sh-syntax)

exec compton -cCGb &
exec urxvtd --quiet &
exec i3
