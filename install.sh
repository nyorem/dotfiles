#! /usr/bin/env bash

# Common
stow bin
stow bash
# stow browsers
# stow dircolors
# stow emacs
# stow fish
# stow gdb
# stow ghc
# stow gpg
# stow latex
stow lf
# stow mutt
# stow python
# stow todotxt
stow tmux
stow vcs

SYSTEM=$(uname -s)
if [ "$SYSTEM" = "Darwin" ]; then
    ## OSX

    ### KeyRemap4MacBook
    KEYREMAP_NEW="$HOME/dotfiles/keyremap4macbook/private.xml"
    KEYREMAP_OLD="$HOME/Library/Application Support/KeyRemap4MacBook/private.xml"

    cmp --silent "$KEYREMAP_OLD" "$KEYREMAP_NEW" || ln -sv "$KEYREMAP_NEW" "$KEYREMAP_OLD"

    ### stow
    stow bash
    stow hydra
    stow iterm
    stow keyremap4macbook
    # stow slate
elif [ "$SYSTEM" = "Linux" ]; then
    ## Linux

    ### stow
    # stow i3
    # stow media
    stow terminator
    # stow x
    # stow xmonad

    ## archlinux
    if [ -x "$(command -v pacman)" ]; then
        stow arch
    fi
fi
