function git_prompt
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

function hg_prompt
  set fish_hg_dirty_color red
  set fish_hg_not_dirty_color blue
  set -l branch (hg branch)
  set -l hg_diff (hg diff)

  if test -n "$hg_diff"
	echo (set_color "$fish_hg_dirty_color")$branch(set_color normal)
  else
	echo (set_color "$fish_hg_not_dirty_color")$branch(set_color normal)
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
	printf ' (%s)' (git_prompt)
  end

  if test -d .hg
	set_color normal
	printf ' (%s)' (hg_prompt)
  end

  printf ' $ '
  set_color normal

  if test $VIRTUAL_ENV
	  printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
  end
  set_color normal
end
