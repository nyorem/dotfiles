# sjl z (inspired by rupa z)
. $fish_function_path/z.fish

# ALIASES
alias t="$HOME/bin/t.py --task-dir $HOME/tasks --list TODO --delete-if-empty"
alias ...="cd ../../"

# PATH
# set -x PATH /usr/local/gnat/bin $PATH # gnat
set -x PATH /usr/local/bin $PATH # brew
set -x PATH /usr/local/sbin $PATH # brew
set -x PATH $HOME/bin $PATH # my bin
set -x PATH /usr/local/texlive/2013/bin/universal-darwin $PATH # TexLive 2013
set -x PATH HOME/.rvm/bin $PATH # Add RVM to PATH for scripting
set -x PATH $HOME/.rvm/gems/ruby-2.0.0-p247/bin $PATH # rvm

# MANPATH
set -x MANPATH /usr/local/share/man $MANPATH
set -x MANPATH /usr/share/man $MANPATH

# VARIABLES
set -x MATLAB_USE_USERWORK 1
set -x EDITOR vim
set -x HOMEBREW_CASK_OPTS '--appdir=/Applications'

# ls colors
eval (gdircolors -c ~/dotfiles/dircolors/solarized/dircolors.ansi-light | sed 's/>&\/dev\/null$//')
