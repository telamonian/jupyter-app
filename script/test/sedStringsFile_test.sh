#!/usr/bin/env bash

sedStringsFile() {
    key=$1
    val=$2
    shift 2

    for pth in $@; do
        echo sed -i '' "s/${key}.*/${key} = \"${val}\";/g" ${pth}
    done
}
