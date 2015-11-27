#! /bin/bash

playing="$(mpc current -f "[%artist% - ]%title%")"

if [[ -z $playing ]]; then
    playing=" ◼ Stopped"
else
    status="►"
    mpc | grep "\[paused\]" 1>/dev/null && status="▷"
    playing="$status $playing"
fi

echo $playing

