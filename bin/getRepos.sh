#! /usr/bin/env bash
# $1 = username

username=$1
repos=$(mktemp XXXX)

curl "https://api.github.com/users/$username/repos"> $repos
cat $repos | grep "full_name" | cut -d \"  -f 4 | cut -d / -f 2
rm -f $repos

