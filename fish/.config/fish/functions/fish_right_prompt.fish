function fish_right_prompt -d "Right prompt"
    # git prompt
    set -g __fish_git_prompt_showdirtystate 1
    set -g __fish_git_prompt_showcolorhints 1
    __fish_git_prompt

    # hg prompt
    # __fish_hg_prompt

    # # Number of jobs
    set -l j (jobs | wc -l)
    if [ $j -ne 0 ]
        set_color yellow
        printf ' (%d) ' $j
    end
end
