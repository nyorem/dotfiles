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

    PS1+="${green}\u@\h${reset}:${blue}\w${reset}"
    PS1+="${red}$(__git_ps1 ' (%s)')${reset} "
    PS1+="\$ "

    # Set terminal title
    echo -ne "\e]0;$(basename $PWD)\a"
}

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias less='less -R'
    alias diff='diff --color'

    # Color for manpages in less makes manpages a little easier to read

    # $(tput setaf x):          man terminfo (then search COLOR_BLACK)
    # LESS_TERMCAP_x=$(tput y): man terminfo

    if [ -f "$HOME/.LESS_TERMCAP" ]; then
        eval $(dircolors -b $HOME/.LESS_TERMCAP)
    else
        if [ -x "$(command -v tput)" ]; then
            export LESS_TERMCAP_mb=$(tput blink; tput setaf 2)              # begin blink
            export LESS_TERMCAP_md=$(tput bold; tput setaf 5)               # begin bold
            export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4) # begin standout mode
            export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7)    # begin underline
            export LESS_TERMCAP_me=$(tput sgr0)                 # reset bold/blink
            export LESS_TERMCAP_se=$(tput rmso; tput sgr0)      # reset standout mode
            export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)      # reset underline
            export LESS_TERMCAP_mr=$(tput rev)      # enter reverse video mode
            export LESS_TERMCAP_mh=$(tput dim)      # turn on half‐bright mode
            export LESS_TERMCAP_ZN=$(tput ssubm)    # enter subscript mode
            export LESS_TERMCAP_ZO=$(tput ssupm)    # enter subscript mode
            export LESS_TERMCAP_ZV=$(tput rsubm)    # end subscript mode
            export LESS_TERMCAP_ZW=$(tput rsupm)    # end subscript mode
        else
            # backup
            export LESS_TERMCAP_mb=$'\e[1;31m'     # begin blink
            export LESS_TERMCAP_md=$'\e[1;33m'     # begin bold
            export LESS_TERMCAP_so=$'\e[01;44;37m' # begin standout mode
            export LESS_TERMCAP_us=$'\e[01;37m'    # begin underline
            export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
            export LESS_TERMCAP_se=$'\e[0m'        # reset standout mode
            export LESS_TERMCAP_ue=$'\e[0m'        # reset underline
        fi
    fi
fi

# To have colors for ls and all grep commands such as grep, egrep and zgrep
export CLICOLOR=1

# For Konsole and Gnome-terminal
export GROFF_NO_SGR=1

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
