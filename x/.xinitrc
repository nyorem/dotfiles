#! /bin/sh

setxkbmap fr

# xbindkeys
sxhkd -c $HOME/.sxhkdrc > /dev/null 2>&1 &

xrdb -load .Xresources
feh --bg-fill $HOME/Desktop/media/Images/background

exec swm
# exec i3

