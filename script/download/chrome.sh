#!/usr/bin/env bash

dmgloc=$1

printf "downloading vanilla google chrome...\n"
dryecho curl https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg -o ${dmgloc}
printf "done\n\n"
