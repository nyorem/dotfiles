function fish_prompt
	# err - [tasks] 'dir' λ

    # exit status
    set -l last_status $status
    if [ $last_status -ne 0 ]
        printf '%s%d%s - ' (set_color red --bold) $last_status
    end
    set_color normal

	# z
	z --add "$PWD"

    # tasks
	set_color yellow
	printf '[%s] ' (tasks)
	set_color normal

    # working directory
	set_color $fish_color_cwd
	printf '%s' (prompt_pwd)
	set_color normal

    # vi mode
	# printf " %s" $vi_mode
	# set_color normal
	printf ' λ '

    # python's virtualenv
	if test $VIRTUAL_ENV
		printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
	end
	set_color normal
end
