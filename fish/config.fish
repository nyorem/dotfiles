# z
. $fish_function_path/z.fish

# Aliases
alias t="$HOME/bin/t.py --task-dir $HOME/tasks --list TODO --delete-if-empty"
alias psu="sudo port selfupdate"
alias puni="sudo port uninstall inactive"
alias pc="sudo port clean installed"
alias evince="skim"
alias ...="cd ../../"

# Path
set -x PATH usr/local/gnat/bin $PATH # gnat
set -x PATH /opt/local/bin $PATH # macports
set -x PATH /opt/local/sbin $PATH # macports 2
set -x PATH $HOME/bin $PATH # my bin
set -x PATH /opt/local/libexec/gnubin $PATH # coreutils -> ls colors
set -x PATH /usr/local/texlive/2013/bin/universal-darwin $PATH # TexLive 2013
set -x PATH HOME/.rvm/bin $PATH # Add RVM to PATH for scripting
set -x PATH /opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin $PATH # pip
set -x PATH $GOROOT/bin $PATH
set -x MANPATH /opt/local/share/man $MANPATH # man macports

# Variables
set -x MATLAB_USE_USERWORK 1
set -x EDITOR vim

# Colorations lors d'un ls
eval (dircolors -c ~/dotfiles/dircolors/solarized/dircolors.ansi-dark | sed 's/>&\/dev\/null$//')
