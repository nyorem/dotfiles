function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _git_status_symbol
  set -l git_status (git status --porcelain ^/dev/null)
  if test -n "$git_status"
    # Is there anyway to preserve newlines so we can reuse $git_status?
    if git status --porcelain ^/dev/null | grep '^.[^ ]' >/dev/null
      echo '*' # dirty
    else
      echo '#' # all staged
    end
  else
    echo    '' # clean
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

  if test -n (_git_branch_name)(_git_status_symbol)
    printf ' (%s)' (_git_branch_name)(_git_status_symbol)
    set_color red
  end

  printf ' $ '
  set_color normal

  if test $VIRTUAL_ENV
      printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
  end
  set_color normal
end
