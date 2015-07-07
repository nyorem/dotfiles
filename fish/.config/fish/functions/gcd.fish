function gcd
    # Test if we are in a git repo
    git rev-parse --is-inside-work-tree ^ /dev/null > /dev/null

    if test $status -eq 0
        cd (command git rev-parse --show-toplevel)
    end
end
