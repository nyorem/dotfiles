function whofap
    git ls-tree --name-only -z -r HEAD | ggrep -z -Z -E '\.(c|h|cpp|hpp|tpp|glsl)$'|xargs -0 -n1 git blame --line-porcelain | grep '^author '| sort | uniq -c | sort -nr
end
