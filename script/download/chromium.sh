#!/usr/bin/env bash

dmgloc=$1

printf "downloading chromium...\n"

# figure out version of latest chromium dev binary
VERSION=$(curl https://raw.githubusercontent.com/ungoogled-software/ungoogled-chromium-binaries/master/feed.xml  2>/dev/null | grep "<title.*macOS.*development.*>" | sed -e "s/.*macOS: \([-a-zA-Z0-9\.]*\).*/\1/g")

# form the actual download url
URL="https://github.com/unpredictable/ungoogled-chromium-binaries/releases/download/${VERSION}.1/ungoogled-chromium_${VERSION}.1_macos.dmg"

# do the actual download
dryecho curl $URL -o ${dmgloc}

printf "...done\n\n"
