#! /usr/bin/env bash

id=$(wmctrl -l | grep "Firefox" | tail -1 | grep -o "0x[0-9]\+")
current=$(xdotool getactivewindow)

wmctrl -ia $id
sleep 0.15
xdotool key ctrl+alt+o
wmctrl -ia $current

