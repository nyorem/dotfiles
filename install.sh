#! /usr/bin/env bash

# Common
stow bin
stow browsers
stow dircolors
# stow emacs
# stow fish
stow ghc
stow gpg
stow latex
stow media
stow mutt
stow todotxt
stow tmux
stow vcs
stow x

SYSTEM=$(uname -s)
if [ $SYSTEM = "Darwin" ]; then
    ## OSX

    ### KeyRemap4MacBook
    KEYREMAP_NEW="$HOME/dotfiles/keyremap4macbook/private.xml"
    KEYREMAP_OLD="$HOME/Library/Application Support/KeyRemap4MacBook/private.xml"

    cmp --silent "$KEYREMAP_OLD" "$KEYREMAP_NEW" || ln -sv $KEYREMAP_NEW $KEYREMAP_OLD

    ### stow
    stow bash
    stow hydra
    stow iterm
# stow slate
elif [ $SYSTEM = "Linux" ]; then
    ## Linux

    ### stow
    stow arch
    # stow i3
    # stow torrent
    # stow xmonad
fi

