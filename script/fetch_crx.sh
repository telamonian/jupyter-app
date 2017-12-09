#!/usr/bin/env bash
# example: fetch_crx material_dark npadhaijchjemiifipabpmeebeelbmpd

NAME=$1     # the .crx will be downloaded and saved to ${NAME}.crx
ID=$2       # the target extension's id in the store
URL="https://clients2.google.com/service/update2/crx?response=redirect&prodversion=38.0&x=id%3D${ID}%26uc"    # prodversion has to be present and at least 38.0, but doesn't seem to affect anything otherwise

# -L to handle any redirects
curl -L "$URL" > "${NAME}.crx"
