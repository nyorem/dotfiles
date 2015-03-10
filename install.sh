#! /usr/bin/env sh

# bin
BIN_NEW="$HOME/dotfiles/bin"
BIN_OLD="$HOME/bin"

rm "$BIN_OLD"
ln -sv "$BIN_NEW" "$BIN_OLD"

# KeyRemap4MacBook
KEYREMAP_NEW="$HOME/dotfiles/keyremap4macbook/private.xml"
KEYREMAP_OLD="$HOME/Library/Application Support/KeyRemap4MacBook/private.xml"

cmp --silent "$KEYREMAP_OLD" "$KEYREMAP_NEW" || ln -sv $KEYREMAP_NEW $KEYREMAP_OLD

# stow
stow bash
stow dircolors
stow emacs
stow firefox
stow fish
stow ghc
stow hydra
stow mutt
# stow slate
stow tmux
stow vcs
stow zsh

