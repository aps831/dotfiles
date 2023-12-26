#!/bin/sh

set -e

if [ ! "$(command -v chezmoi)" ]; then
  bin_dir="$HOME/.local/bin"
  chezmoi="$bin_dir/chezmoi"
  if [ "$(command -v curl)" ]; then
    sh -c "$(curl -fsLS https://chezmoi.io/get)" -- -b "$bin_dir"
  elif [ "$(command -v wget)" ]; then
    sh -c "$(wget -qO- https://chezmoi.io/get)" -- -b "$bin_dir"
  else
    echo "To install chezmoi, you must have curl or wget installed." >&2
    exit 1
  fi
else
  chezmoi=chezmoi
fi

export DOPPLER_PROJECT=development
[ -z "$CODESPACES" ] && export DOPPLER_CONFIG=$(hostname) || export DOPPLER_CONFIG=codespaces
export DOPPLER_TOKEN=${DOPPLER_DEVELOPMENT_CODESPACES_TOKEN:=$(doppler configure --json | yq '.. | select(has("token"))' | yq '.token')}
if [ ${DOPPLER_TOKEN} = "null" ]; then
  echo "Unable to obtain Doppler token from CLI authentication.  Exiting"
  exit    
fi

script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"
exec "$chezmoi" init --apply "--source=$script_dir"
