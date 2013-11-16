# Vi mode
set -o vi

#Variables d'environnement
# export PATH=/usr/local/mips-elf-linux-cep/bin:$PATH #binutils
export PATH=/usr/local/bin:$PATH #brew
export PATH=/usr/local/gnat/bin:$PATH #gnat
export PATH=$HOME/bin:$PATH # my bin

# bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Couleurs du préfixe du terminal
NM="\[\033[0;38m\]" 
HI="\[\033[0;37m\]" 
HII="\[\033[0;36m\]" 
SI="\[\033[0;33m\]"
IN="\[\033[0m\]"

# Allure du prompt 
export PS1="$NM> $HII\u: $SI\w$NM $ $IN"
# ancien : export PS1="$NM[$HI\u@$HII\h:$SI\w $NM] $IN"
 
# alias
alias ls="ls -G"
alias ll="ls -lh"
alias la="ls -A"
alias gnatmake="gnatmake -O3 -gnato -fstack-check" # Options de compilation
alias gdb="/usr/bin/gdb -q" # Fourni avec OSX
alias gcc="/usr/bin/gcc" # Idem
alias g++="/usr/bin/g++" # Idem
alias skim="open /Applications/Skim.app"
alias vi="vim"

export EDITOR=vim

# Quelques trucs symapthiques
fortune -e | cowsay -n
echo

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
