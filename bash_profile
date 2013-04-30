# Vi mode
set -o vi

#Variables d'environnement
export PATH=/usr/local/mips-elf-linux-cep/bin:$PATH #binutils
export PATH=/usr/local/bin:$PATH #ghdl
export PATH=/usr/local/gnat/bin:$PATH #gnat
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH #man
export PATH=/Users/Jocelyn/Qt5.0.1/5.0.1/clang_64/bin:$PATH #Qt
export PATH=$HOME/bin:$PATH # my bin

# bash-completion
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
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

# jeux
alias sol="wine /Users/Jocelyn/.wine/drive_c/Program\ Files//Windows\ Games/sol.exe"
alias mine="wine /Users/Jocelyn/.wine/drive_c/Program\ Files/Windows\ Games/Minesweeper\ XP/winmine.exe"
alias freecell="wine /Users/Jocelyn/.wine/drive_c/Program\ Files/Windows\ Games/freecell.exe"
alias v="cd /Users/Jocelyn/.wine/drive_c/Program\ Files/VVVVVV; wine VVVVVV.exe"

export EDITOR=vim

# Quelques trucs symapthiques
fortune -e | cowsay -n
echo
