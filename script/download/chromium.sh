#!/usr/bin/env bash

shopt -s expand_aliases
set -e

zipPath=$1

# define the dryrun echo command as appropriate
alias dryecho=
if [ "$2" = "-d" ]; then
    alias dryecho='echo'
fi

printf "downloading chromium...\n"

# figure out version of latest chromium dev binary
VERSION=$(curl https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Mac%2FLAST_CHANGE?alt=media 2>/dev/null)

# form the actual download url
URL="https://commondatastorage.googleapis.com/chromium-browser-snapshots/Mac/${VERSION}/chrome-mac.zip"

# download the zip. -L to follow redirects
dryecho curl -L $URL -o "${zipPath}"

printf "...done\n\n"
