#!/bin/bash

unset COLORTERM

function my_cat()
{
    if [ -x "$(command -v bat)" ]; then
        /usr/bin/batcat --color always "$@"
    else
        cat "$@"
    fi
}

case "$1" in
    *.tar*) tar tf "$1";;
    *.zip) unzip -l "$1";;
    # *.rar) unrar l "$1";;
    # *.7z) 7z l "$1";;
    # *.pdf) pdftotext "$1" -;;
    *) my_cat "$@" ;;
esac
