# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt
PROMPT_COMMAND=__prompt_command

function __prompt_command() {
    local EXIT="$?"
    PS1=""

    # user@hostname:pwd$
    local green='\[\e[1;32m\]'
    local blue='\[\e[1;34m\]'
    local red='\[\e[1;31m\]'
    local reset='\[\e[0m\]'

    # Test if inside Yocto environment
    if [ -n "$BBPATH" ]; then
	PS1+="(yocto) "
    fi

    # Test if inside Python virtualenv
    if [ -n "$VIRTUAL_ENV_PROMPT" ]; then
	PS1+="(venv) "
    fi

    # Add exit code
    if [ $EXIT != 0 ]; then
	PS1+="${red}[${EXIT}]${reset} "
    fi

    PS1+="${green}\u@\h${reset}:${blue}\w${reset}\$ "

    # Set terminal title
    echo -ne "\e]0;$(basename $PWD)\a"
}

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
