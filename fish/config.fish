# rupa z
. $fish_function_path/z.fish

# Aliases
alias t="$HOME/bin/t.py --task-dir $HOME/tasks --list TODO --delete-if-empty"
alias evince="skim"
alias ...="cd ../../"

# Path
# set -x PATH /usr/local/gnat/bin $PATH # gnat
set -x PATH /usr/local/bin $PATH # brew
set -x PATH /usr/local/sbin $PATH # brew
set -x PATH $HOME/bin $PATH # my bin
set -x PATH /usr/local/texlive/2013/bin/universal-darwin $PATH # TexLive 2013
set -x PATH HOME/.rvm/bin $PATH # Add RVM to PATH for scripting
set -x PATH $HOME/.rvm/gems/ruby-2.0.0-p247/bin $PATH # rvm

# Manpath
set -x MANPATH /usr/local/share/man $MANPATH

# Variables
set -x MATLAB_USE_USERWORK 1
set -x EDITOR vim
set -x HOMEBREW_CASK_OPTS '--appdir=/Applications'

# Colorations lors d'un ls
eval (gdircolors -c ~/dotfiles/dircolors/solarized/dircolors.ansi-dark | sed 's/>&\/dev\/null$//')
