# {{{1 Environment variables
export PATH="$HOME/.local/bin:$PATH" # Python local binaries
export PATH="$HOME/.cargo/bin:$PATH" # Rust
export PATH="$HOME/dev/bin:$PATH" # custom scripts
export PATH="$HOME/bin:$PATH" # custom scripts
export PATH="$HOME/.config/emacs/bin:$PATH" # Doomemacs

# {{{1 Aliases
# {{{2 Common
alias s="sudo apt-get"
alias ss="sudo apt-get -f"

alias editbash="$EDITOR $HOME/.bash_aliases"

if [ -x "$(command -v nvim)" ]; then
  alias vimdiff="nvim -d"
  export EDITOR="nvim"
else
  export EDITOR="vim"
fi

export VISUAL="$EDITOR"
export GIT_EDITOR="$EDITOR"

# make vim know how to open a filename with a :line:column specifier
function e {
  # see https://stackoverflow.com/questions/26733668/vim-interpret-argument-with-colons-as-filenamelinecolumn
  local args
  IFS=':' read -a args <<< "$1"
  if [ -z "${args[1]}" ]; then
    args[1]="1"
  fi
  if [ -z "${args[2]}" ]; then
    args[2]="1"
  fi
  "$EDITOR" "${args[0]}" -c "norm!${args[1]}G0${args[2]}|"
}

alias o="open"

if [ -x "$(command -v exa)" ]; then
  alias ls="exa"
  alias ll="exa -l"
  alias la="exa -a"
  alias tree="exa --tree"
else
  alias ll="ls -l"
  alias la="ls -a"
fi

alias l="ls"

if [ -x "$(command -v zoxide)" ]; then
  alias cd="z"
  alias zz="z -"

  function ze() {
    DIR=$(zoxide query -i "$@")
    [ -n "$DIR" ] && cd "$DIR" && e .
  }
fi

# https://unix.stackexchange.com/questions/162131/is-this-a-good-way-to-create-a-patch
alias makediff="diff -Naur"
alias makerdiff="diff -ur"
alias testpatch="patch -p1 --dry-run"

alias r="fc -s"

alias du="du -h"
alias free="free -h"

alias ..="cd .."
alias ...="cd ../.."
alias :wq="exit"

alias python="python3"
alias py="python3 -i"
alias venv="source venv/bin/activate"

alias hl="rg --passthru"

alias m="make"
alias maek="make"
function mm() {
  make -j7 $*
}

# {{{2 git
alias g="git"
alias ga="git add"
alias gap="git add --patch"
alias gc="git commit"
alias gcl="git clone"
alias gst="git status"
alias gpu="git pull"
alias gpr="git pull --rebase"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gpff="git push --force"
alias gd="git diff"
alias gds="git diff --staged"
alias gco="git checkout"
alias gsu="git submodule update --init"
alias gss="git stash"
alias gsp="git stash pop"
alias gsc="git stash clear"
# alias gcf="git clang-format --staged --style=file -q --diff"
alias gcf="git clang-format --staged --style=file -q"
alias tig="tig status"

if [ -x "$(command -v lazygit)" ]; then
  alias gg="lazygit"
fi

function git-fat-files() {
  git rev-list --all --objects | \
    sed -n $(git rev-list --objects --all | \
    cut -f1 -d' ' | \
    git cat-file --batch-check | \
    grep blob | \
    sort -n -k 3 | \
    tail -n40 | \
    while read hash type size; do 
         echo -n "-e s/$hash/$size/p ";
    done) | \
    sort -n -k1
}

function git-eradicate() {
  [ "$#" -ne 1 ] && { echo "Usage: git-eradicate <file>"; return 1; }

  local file="$1"
  echo "Eradicating $file from git history, are you sure? (y/N)"
  read answer
  if [ "$answer" != "y" ]; then
    echo "Aborting"
    return
  fi

  git filter-branch -f  --index-filter \
    "git rm --force --cached --ignore-unmatch $file" \
    -- --all
  rm -Rf .git/refs/original && \
    git reflog expire --expire=now --all && \
    git gc --aggressive && \
    git prune
}

function git-cleanup-branches() {
  git fetch -p && for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'); do git branch -D $branch; done
}

function git-worktree-switch() {
  result=$(git worktree list | awk '{print $1}' | fzf --height 40% --reverse)
  if [ $? -eq 0 ]; then
    cd "$result"
  fi
}

# {{{2 vim
alias vimgit="vim +G +only"
alias vim-update="vim +PlugUpgrade +PlugUpdate && nvim +PlugUpdate"

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
    builtin cd "$(/usr/bin/cat "$tmp")" || return
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

# https://github.com/google/googletest/blob/v1.14.0/docs/advanced.md#controlling-how-failures-are-reported
gtest_enable_error_catching()
{
  export GTEST_CATCH_EXCEPTIONS=0
  export GTEST_BREAK_ON_FAILURE=1
}

gtest_disable_error_catching()
{
  unset GTEST_CATCH_EXCEPTIONS
  unset GTEST_BREAK_ON_FAILURE
}

profile()
{
  valgrind --tool=callgrind --dump-instr=yes --collect-jumps=yes $*
}

profile_custom()
{
  valgrind --tool=callgrind --dump-instr=yes --collect-jumps=yes --instr-atstart=no --collect-atstart=no $*
}

# {{{1 bash stuff
source ~/.bash_completion.d/complete_alias
source ~/.bash_completion.d/git-completion

complete -F _complete_alias s
complete -F _complete_alias ss

complete -F _complete_alias g
complete -F _complete_alias gco
complete -F _complete_alias gp
complete -F _complete_alias gpr
complete -F _complete_alias gpu

[ -s "$HOME/.cargo/env" ] && \. "$HOME/.cargo/env"

eval "$(fzf --bash)"

export FZF_DEFAULT_COMMAND="rg --files --hidden -g '!.git/'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# https://github.com/BurntSushi/ripgrep/issues/169
_fzf_compgen_dir() {
  rg --hidden --files --glob "!.git" --null "$1" 2>/dev/null | xargs -0 dirname | awk '!h[$0]++'
}

# Set up completion for custom commands/aliases
_fzf_setup_completion path e

# make sure history is saved on each command
shopt -s histappend
PROMPT_COMMAND="$PROMPT_COMMAND;history -a;history -c;history -r"

# {{{1 WSL
if uname -r | grep -q "microsoft"; then
  # https://learn.microsoft.com/en-us/windows/terminal/tutorials/new-tab-same-directory
  PROMPT_COMMAND=${PROMPT_COMMAND:+"$PROMPT_COMMAND; "}'printf "\e]9;9;%s\e\\" "$(wslpath -w "$PWD")"'

  explorer() {
    /mnt/c/Windows/explorer.exe $(wslpath -w "$1")
  }
  alias open="explorer"
  alias o="explorer"
  alias clip="/mnt/c/Windows/System32/clip.exe"
else
  alias clip="xclip -selection clipboard"
fi

shopt -s autocd

if [ -x "$(command -v zoxide)" ]; then
  eval "$(zoxide init bash)"
fi

# {{{1 PRIVATE
[ -s "$HOME/.bash_aliases_private" ] && source "$HOME/.bash_aliases_private"
