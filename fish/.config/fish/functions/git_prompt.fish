function git_prompt
	set -l branch (command git rev-parse --abbrev-ref HEAD ^/dev/null)
	set -l dirty (command git diff)

	set fish_git_dirty_color red
	set fish_git_not_dirty_color blue

	if test -n "$dirty"
		echo (set_color "$fish_git_dirty_color")$branch(set_color normal)
	else
		echo (set_color "$fish_git_not_dirty_color")$branch(set_color normal)
	end
end
