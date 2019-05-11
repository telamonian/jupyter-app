#!/usr/bin/env bash

shopt -s expand_aliases
set -e

# define the dryrun echo command as appropriate
alias dryecho=
if [ "$1" = "-d" ]; then
    alias dryecho='echo'
fi

dryecho echo foo
