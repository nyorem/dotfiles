function parse_git_branch
  set -l branch (git branch ^/dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
  set -l git_diff (git diff)

  set fish_git_dirty_color red
  set fish_git_not_dirty_color blue

  if test -n "$git_diff"
    echo (set_color "$fish_git_dirty_color")$branch(set_color normal)
  else
    echo (set_color "$fish_git_not_dirty_color")$branch(set_color normal)
  end
end

function fish_prompt
  z --add "$PWD"

  set_color blue
  printf '[%s]' (tasks)
  set_color yellow
  printf ' %s' (whoami)
  set_color normal
  printf ' at '

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal

  if test -d .git
    set_color normal
    printf ' (%s)' (parse_git_branch)
  end

  printf ' $ '
  set_color normal

  if test $VIRTUAL_ENV
      printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
  end
  set_color normal
end
