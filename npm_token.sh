#! /bin/bash
grep -Po "(?<=_authToken=NpmToken\.).*" "$HOME/.npmrc"
