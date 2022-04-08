#!/bin/bash

export AWS_PROFILE="andrew-p-spratley"

aws sso login
mkdir "$HOME/.profile.d/"
echo "#! /bin/bash" > "$HOME/.profile.d/github.sh"
echo "export GITHUB_USER=$(aws ssm get-parameter --name "/devcontainer/$PROJECT_NAME/github-user" --with-decryption 2>/dev/null | jq '.Parameter.Value' )" >> $HOME/.profile.d/github.sh
echo "export GITHUB_TOKEN=$(aws ssm get-parameter --name "/devcontainer/$PROJECT_NAME/github-token" --with-decryption 2>/dev/null | jq '.Parameter.Value' )">> $HOME/.profile.d/github.sh

source "$HOME/.profile.d/github.sh"

if [ -z "$PROJECT_NAME" ]; then
    /usr/bin/printf "\u2718 PROJECT_NAME environment variable not read\n"
else
    /usr/bin/printf "\u2714 PROJECT_NAME environment variable read\n"
fi

if [ -z "$GITHUB_USER" ]; then
    /usr/bin/printf "\u2718 GITHUB_USER environment variable not set\n"
else
    /usr/bin/printf "\u2714 GITHUB_USER environment variable set\n"
fi

if [ -z "$GITHUB_TOKEN" ]; then
    /usr/bin/printf "\u2718 GITHUB_TOKEN environment variable not set\n"
else
    /usr/bin/printf "\u2714 GITHUB_TOKEN environment variable set\n"
fi

echo "Open a new terminal for the changes to take effect"



