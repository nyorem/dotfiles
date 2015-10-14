#! /usr/bin/env bash
# Extract the audio from a video using ffmpeg
# Dependencies: ffmpeg

IN="$1"
OUT="${IN%.*}".mp3

ffmpeg -i "$IN" "$OUT"
