# sjl z (inspired by rupa z)
. $fish_function_path/z.fish

# vi-mode
# . $fish_function_path/vi-mode.fish
# function fish_user_key_bindings
# 	vi_mode_insert
# end

# ALIASES
alias t="$HOME/bin/t.py --task-dir $HOME/tasks --list TODO --delete-if-empty"
alias ...="cd ../../"

# PATH
set -x PATH $HOME/bin $PATH # my bin

## brew
set -x PATH /usr/local/bin $PATH
set -x PATH /usr/local/sbin $PATH

# texlive
set -x PATH /usr/local/texlive/2014/bin/universal-darwin $PATH

## rvm
set -x PATH $HOME/.rvm/bin $PATH # Add RVM to PATH for scripting
set -x PATH $HOME/.rvm/gems/ruby-2.0.0-p247/bin $PATH # rvm

## cgal
set CGAL_DIR $HOME/projets/cgal/repo # gsoc
set CGAL_DIR_MASTER $HOME/projets/cgal/master # master
set -x PATH $CGAL_DIR_MASTER/Scripts/scripts $PATH
set -x PATH $CGAL_DIR_MASTER/Scripts/developer_scripts $PATH

## android
# set -x PATH $HOME/dev/droid/adt/sdk/platform-tools $PATH

## cuda
# set -x PATH /Developer/NVIDIA/CUDA-6.5/bin $PATH

## haskell
set -x PATH $HOME/.cabal/bin $PATH # cabal
set GHC_DOT_APP /Applications/ghc-7.8.2.app
set -x PATH $GHC_DOT_APP/Contents/bin $PATH # ghc

# MANPATH
set -x MANPATH /usr/local/share/man $MANPATH
set -x MANPATH /usr/share/man $MANPATH

# VARIABLES
set -x EDITOR vim
set -x HOMEBREW_CASK_OPTS '--appdir=/Applications'
set -x JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.7.0_10.jdk/Contents/Home/

# ls colors
eval (gdircolors -c ~/dotfiles/dircolors/solarized/dircolors.ansi-light | sed 's/>&\/dev\/null$//')
