# sjl z (inspired by rupa z)
. $fish_function_path/z.fish

# ALIASES
alias t="$HOME/bin/t.py --task-dir $HOME/tasks --list TODO --delete-if-empty"
alias ...="cd ../../"

# Projet GL
set -x PATH $HOME/bin/ProjetGL/global/bin $PATH
set -x PATH $HOME/projets/gl/src/main/bin $PATH
set -x PATH $HOME/projets/gl/src/test/script $PATH
set -x PATH $HOME/projets/gl/src/test/script/launchers $PATH
set -x PATH $HOME/bin/ProjetGL/apache-maven-3.1.1/bin $PATH
set -x JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.7.0_10.jdk/Contents/Home/

alias gldoc="evince $HOME/dotfiles/bin/ProjetGL/global/doc/main_etu.pdf"

# PATH
# set -x PATH /usr/local/gnat/bin $PATH # gnat
set -x PATH /usr/local/bin $PATH # brew
set -x PATH /usr/local/sbin $PATH # brew
set -x PATH $HOME/bin $PATH # my bin
set -x PATH /usr/local/texlive/2013/bin/universal-darwin $PATH # TexLive 2013
set -x PATH HOME/.rvm/bin $PATH # Add RVM to PATH for scripting
set -x PATH $HOME/.rvm/gems/ruby-2.0.0-p247/bin $PATH # rvm
set -x PATH (brew --prefix josegonzalez/php/php54)/bin $PATH # php

# MANPATH
set -x MANPATH /usr/local/share/man $MANPATH
set -x MANPATH /usr/share/man $MANPATH

# VARIABLES
set -x MATLAB_USE_USERWORK 1
set -x EDITOR vim
set -x HOMEBREW_CASK_OPTS '--appdir=/Applications'

# ls colors
eval (gdircolors -c ~/dotfiles/dircolors/solarized/dircolors.ansi-light | sed 's/>&\/dev\/null$//')
