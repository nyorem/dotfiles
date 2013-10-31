function fish_prompt
  set_color blue
  printf '[%s]' (tasks)
  set_color yellow
  printf ' %s' (whoami)
  set_color normal
  printf ' at '

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal
  printf '%s' (__fish_git_prompt)
  set_color red
  printf ' $ '
  set_color normal

  if test $VIRTUAL_ENV
      printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
  end
  set_color normal
end
