#! /usr/bin/env bash
# Create a playlist 'recent.m3u' containing music newer than $1 days.
# c = creation / m = modification / a = access

NEWER="$1"
MUSICDIR="$HOME/Desktop/media/Music"
PLAYLISTFILE="recent.m3u"

find $MUSICDIR -iname "*.mp3" -mtime -"$NEWER" -print

read -p "Do you wish to continue? (Y/n) " yn
case $yn in
    [Yy]* ) find $MUSICDIR -iname "*.mp3" -mtime -"$NEWER" > "$HOME/.mpd/playlists/$PLAYLISTFILE"
        ;;
    * ) exit
        ;;
esac

