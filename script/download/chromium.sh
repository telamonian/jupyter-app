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

# get the feed with the info on the latest version
FEED=$(curl https://raw.githubusercontent.com/ungoogled-software/ungoogled-chromium-binaries/master/feed.xml 2>/dev/null | cat)

# figure out version of latest chromium dev binary
VERSION=$(echo "${FEED}" | grep "<title.*macOS.*development.*>" | sed -e "s/.*macOS: \([-a-zA-Z0-9\.]*\).*/\1/g")

# get the link to the download page
DOWNLOAD_PAGE_URL=$(echo "${FEED}" | grep "<link href.*macos/${VERSION}.*>" | sed -e "s/.*<link href=\"\(http.*\)\" \/>/\1/g")

# fetch the actual download url
URL=$(curl "${DOWNLOAD_PAGE_URL}" 2>/dev/null | grep macos.dmg | sed -e "s/.*<a href=\"\(http.*macos.dmg\)\">.*/\1/g")

# do the actual download. -L to follow redirects
dryecho curl -L $URL -o ${dmgloc}

printf "...done\n\n"
