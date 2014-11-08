function fish_right_prompt -d "Right prompt"
	# Git prompt
	set -l branch (command git rev-parse --abbrev-ref HEAD ^/dev/null)
	if [ $status -eq 0 ]
		set_color normal
		printf ' (%s)' (git_prompt)
	end

	# Hg prompt
	if test -d .hg
		set_color normal
		printf ' (%s)' (hg_prompt)
	end

    # Number of jobs
    set -l j (jobs | wc -l)
    if [ $j -ne 0 ]
        set_color yellow
        printf ' (%d) ' $j
    end
end
