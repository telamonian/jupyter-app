#!/usr/bin/env bash

shopt -s expand_aliases
set -e

dmgloc=$1

# define the dryrun echo command as appropriate
alias dryecho=
if [ "$2" = dryrun ]; then
    alias dryecho='echo'
fi

printf "downloading vanilla google chrome...\n"
dryecho curl https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg -o ${dmgloc}
printf "done\n\n"
