function git_prompt
	set -l branch (git rev-parse --abbrev-ref HEAD ^/dev/null)
	set -l dirty (git diff)

	set fish_git_dirty_color red
	set fish_git_not_dirty_color blue

	if test -n "$dirty"
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
	# z
	z --add "$PWD"

	# [tasks] 'user' at 'dir' (branch) $
	set_color blue
	printf '[%s]' (tasks)
	set_color yellow
	printf ' %s' (whoami)
	set_color normal
	printf ' at '

	set_color $fish_color_cwd
	printf '%s' (prompt_pwd)
	set_color normal

	# Git prompt
	set -l branch (git rev-parse --abbrev-ref HEAD ^/dev/null)
	if [ $status -eq 0 ]
		set_color normal
		printf ' (%s)' (git_prompt)
	end

	# Hg prompt
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
