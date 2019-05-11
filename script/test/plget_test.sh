#!/usr/bin/env bash

shopt -s expand_aliases
set -e

# define the dryrun echo command as appropriate
alias dryecho=
if [ "$1" = "-d" ]; then
    alias dryecho='echo'
fi

# read a single string val from a .plist file
plget() {
    key=$1
    pth=$2

    dryecho plutil -extract $1 xml1 -o - $2 | grep "<string>.*</string>" | sed -e "s/<string>\(.*\)<\/string>/\1/g"
}

ABS_CONTENTS="/Applications/Jupyter.app/Contents"

echo $(plget CFBundleExecutable "${ABS_CONTENTS}/Info.plist")
ABS_APP_BASE_BIN="${ABS_CONTENTS}/$(plget CFBundleExecutable "${ABS_CONTENTS}/Info.plist")"
echo $ABS_APP_BASE_BIN
