#! /bin/bash
source "$(readlink -f $HOME/.nvm/)"/nvm.sh
PREV_VERSION=$(nvm current)
nvm install --lts --latest-npm
nvm reinstall-packages "$PREV_VERSION"
