#! /bin/bash

INPUT_FILE="$HOME/.npmrc"
OUTPUT_FILENAME="/tmp/chezmoi/npm_token"

mkdir -p $(dirname $OUTPUT_FILENAME)
grep -Po "(?<=_authToken=NpmToken\.).*" $INPUT_FILE > $OUTPUT_FILENAME
