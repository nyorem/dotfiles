#! /usr/bin/env bash

# stow
# stow bash
stow bin
stow dircolors
# stow emacs
stow firefox
# stow fish
stow ghc
stow gpg
# stow hydra
# stow i3
# stow iterm
stow mpd
stow mutt
# stow slate
stow tmux
# stow torrent
stow vcs
stow x
# stow xmonad

# OSX specific stuff
SYSTEM=$(uname -s)
if [ $SYSTEM = "Darwin" ]; then
    # KeyRemap4MacBook
    KEYREMAP_NEW="$HOME/dotfiles/keyremap4macbook/private.xml"
    KEYREMAP_OLD="$HOME/Library/Application Support/KeyRemap4MacBook/private.xml"

    cmp --silent "$KEYREMAP_OLD" "$KEYREMAP_NEW" || ln -sv $KEYREMAP_NEW $KEYREMAP_OLD

    # stow
    stow bash
    stow hydra
    stow iterm
fi

