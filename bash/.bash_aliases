# {{{1 Environment variables
export PATH="$HOME/.local/bin:$PATH" # Python local binaries
export PATH="$HOME/.cargo/bin:$PATH" # Rust
export PATH="$HOME/dev/bin:$PATH" # personal scripts
export PATH="$HOME/.config/emacs/bin:$PATH" # Doomemacs

export EDITOR="vim"

# {{{1 Aliases
# {{{2 Common
alias s="sudo apt-get"
alias ss="sudo apt-get -f"
alias e="nvim"
alias o="open"

alias ll="ls -l"
alias la="ls -a"

# https://unix.stackexchange.com/questions/162131/is-this-a-good-way-to-create-a-patch
alias makediff="diff -Naur"
alias makerdiff="diff -crB"
alias testpatch="patch -p1 --dry-run"

alias r="fc -s"

alias ..="cd .."
alias ...="cd ../.."

alias python="python3"
alias py="python3 -i"

alias m="make"
alias maek="make"

# {{{2 git
alias g="git"
alias ga="git add"
alias gc="git commit"
alias gst="git status"
alias gpu="git pull"
alias gpr="git pull --rebase"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gpff="git push --force"
alias gd="git diff"
alias gco="git checkout"
alias gsu="git submodule update --init"
alias gss="git stash"
alias gsp="git stash pop"
alias gsc="git stash clear"
# alias gcf="git clang-format --staged --style=file -q --diff"
alias gcf="git clang-format --staged --style=file -q"
alias tig="tig status"

# {{{2 vim
alias vimgit="vim +G +only"
alias vim-update="vim +PlugUpgrade +PlugUpdate"

# {{{2 tmux
alias tatt="tmux attach -t"
alias tls="tmux ls"

## {{{2 cargo
alias cb="cargo build"
alias cr="cargo run"
alias ct="cargo test"

# {{{2 functions
lf () {
    local tmp="$(mktemp)"
    command lf -command "map <c-w> \$echo \$PWD > $tmp; lf -remote \"send \$id quit\"" "$@"
    cd "$(cat "$tmp")" || return
    rm -f "$tmp"
}

ff()
{
  find . -name $@
}

dockshell()
{
  shell_to_use="$2"
  if [ -z "$2" ]; then
    shell_to_use="bash"
  fi

  docker container exec -it "$1" "$shell_to_use"
}

dmake()
{
  cm -DCMAKE_BUILD_TYPE=Debug $*
}

rmake()
{
  cm -DCMAKE_BUILD_TYPE=Release $*
}

run_limited()
{
  MEMORY="$1"
  shift
  systemd-run --slice=cpulimit.slice --scope -p MemoryMax=$MEMORY --user $*
}

swap()
{
  mv "$1" "$1.tmp"
  mv "$2" "$1"
  mv "$1.tmp" "$2"
}

mx()
{
  tmux new-session -As $(basename $PWD)
}

format-all()
{
  find . -iname *.hpp -o -iname *.cpp | xargs clang-format -i -style=file
}

# {{{1 bash completions
source ~/.bash_completion.d/complete_alias
source ~/.bash_completion.d/git-completion

complete -F _complete_alias s
complete -F _complete_alias ss

complete -F _complete_alias g
complete -F _complete_alias gco
complete -F _complete_alias gp
complete -F _complete_alias gpr
complete -F _complete_alias gpu

# {{{1 PRIVATE
[ -s "$HOME/.bash_aliases_private" ] && source "$HOME/.bash_aliases_private"
