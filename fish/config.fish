# z
. $fish_function_path/z.fish

# Aliases
alias t="$HOME/bin/t.py --task-dir $HOME/tasks --list TODO --delete-if-empty"
alias port="sudo port"
alias puni="port uninstall inactive"
alias pc="port clean installed"
alias ...="cd ../../"

# Path
set PATH usr/local/gnat/bin $PATH # gnat
set PATH /opt/local/bin $PATH # macports
set PATH /opt/local/sbin $PATH # macports 2
set PATH $HOME/bin $PATH # my bin
set PATH /opt/local/libexec/gnubin $PATH # coreutils -> ls colors
set PATH /usr/local/texlive/2013/bin/universal-darwin $PATH # TexLive 2013
set PATH HOME/.rvm/bin $PATH # Add RVM to PATH for scripting
set PATH /opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin $PATH # pip
set MANPATH /opt/local/share/man $MANPATH # man macports

# Variables
set MATLAB_USE_USERWORK 1
set EDITOR vim

# Colorations lors d'un ls
eval (dircolors -c ~/dotfiles/dircolors/solarized/dircolors.ansi-dark | sed 's/>&\/dev\/null$//')
