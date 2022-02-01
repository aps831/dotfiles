#! /bin/bash

FILENAME="/tmp/chezmoi/npm_token"

if [ -f "$FILENAME" ] ; then
    rm $FILENAME
fi

