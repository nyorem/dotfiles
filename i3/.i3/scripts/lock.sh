#! /usr/bin/env bash
# source: https://www.reddit.com/r/unixporn/comments/3358vu/i3lock_unixpornworthy_lock_screen

icon="$HOME/.i3/scripts/lock_icon.png"
tmpbg='/tmp/screen.png'

(( $# )) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
i3lock -u -i "$tmpbg"

