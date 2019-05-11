#!/usr/bin/env bash

shopt -s expand_aliases
set -e

dmgloc=$1

# define the dryrun echo command as appropriate
alias dryecho=
if [ "$2" = "-d" ]; then
    alias dryecho='echo'
fi

printf "downloading chromium...\n"

# figure out version of latest chromium dev binary
VERSION=$(curl https://raw.githubusercontent.com/ungoogled-software/ungoogled-chromium-binaries/master/feed.xml  2>/dev/null | grep "<title.*macOS.*development.*>" | sed -e "s/.*macOS: \([-a-zA-Z0-9\.]*\).*/\1/g")

# form the actual download url
URL="https://github.com/unpredictable/ungoogled-chromium-binaries/releases/download/${VERSION}.1/ungoogled-chromium_${VERSION}.1_macos.dmg"

# do the actual download. -L to follow redirects
dryecho curl -L $URL -o ${dmgloc}

printf "...done\n\n"
