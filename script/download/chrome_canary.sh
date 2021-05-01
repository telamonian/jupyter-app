#!/usr/bin/env bash

shopt -s expand_aliases
set -e

dmgPath=$1

# define the dryrun echo command as appropriate
alias dryecho=
if [ "$2" = dryrun ]; then
    alias dryecho='echo'
fi

# fonts of chrome url knowledge:
# https://www.google.com/chrome/assets/common/js/chrome-installer.min.js
# https://superuser.com/a/1067482

printf "downloading google chrome canary...\n"
dryecho curl https://dl.google.com/release2/q/canary/googlechrome.dmg -o "${dmgPath}"
printf "done\n\n"
