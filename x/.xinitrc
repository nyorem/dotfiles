#! /bin/sh

# Keymap
setxkbmap fr

# wmutils
# xbindkeys
sxhkd -c $HOME/.sxhkdrc > /dev/null 2>&1 &

# Colours / Wallpaper
xrdb -load .Xresources
feh --bg-fill $HOME/Desktop/media/Images/background

# Applications
mpd &

exec i3

