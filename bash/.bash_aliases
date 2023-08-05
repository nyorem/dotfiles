# {{{1 PATH
## personal stuff
export PATH="$HOME/bin:$PATH"
## doom
export PATH="$HOME/.config/emacs/bin:$PATH"
## rust
source $HOME/.cargo/env
## bash completions
source ~/.bash_completion.d/complete_alias
source ~/.bash_completion.d/git-completion

# {{{1 Aliases
## {{{2 git
alias git="hub"
alias g="git"
alias ga="git add"
alias gc="git commit"
alias gco="git checkout"
alias gst="git status"
alias gp="git push"
alias gpu="git pull"
alias gpr="git pull --rebase"
alias gsu="git submodule update --init"
alias gss="git stash"
alias gsp="git stash pop"

# {{{2 tmux
alias tatt="tmux attach -t"
alias tls="tmux ls"

## {{{2 cargo
alias cb="cargo build"
alias cr="cargo run"
alias ct="cargo test"

## {{{2 cmake
alias rmake="cmake -DCMAKE_BUILD_TYPE=Release"
alias dmake="cmake -DCMAKE_BUILD_TYPE=Debug"

## {{{2 misc
alias s="sudo apt-get"
alias ss="sudo apt-get -f"
alias python="python3"
alias py="python3 -i"
alias ..="cd .."
alias ...="cd ../.."
alias m="make"
alias vim-update="vim +PlugUpgrade +PlugUpdate"
alias open="xdg-open"
alias del="gio trash"
alias r="fc -s"

complete -F _complete_alias s
complete -F _complete_alias ss

export EDITOR="vim"

LFCD="$HOME/.config/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi
alias f="lfcd"
