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
