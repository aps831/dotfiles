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
echo "Set DOPPLER_PROJECT=$DOPPLER_PROJECT"

if [ -z "$CODESPACES" ]; then
  export DOPPLER_CONFIG=$(hostname)
else
  export DOPPLER_CONFIG=codespaces
fi
echo "Set DOPPLER_CONFIG=$DOPPLER_CONFIG"

if [ -z "$DOPPLER_DOTFILES_TOKEN" ]; then
  echo "Set DOPPLER_TOKEN from CLI authentication"    
  export DOPPLER_TOKEN=$(doppler configure --json | yq '.. | select(has("token"))' | yq '.token')
else
  echo "Set DOPPLER_TOKEN from environment"  
  export DOPPLER_TOKEN=$DOPPLER_DOTFILES_TOKEN
fi

script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"
exec "$chezmoi" init --apply "--source=$script_dir"
