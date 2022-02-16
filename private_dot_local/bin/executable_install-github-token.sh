#!/bin/bash

export AWS_PROFILE="andrew-p-spratley"

aws sso login
echo "GITHUB_USER=$(aws ssm get-parameter --name "/devcontainer/$PROJECT_NAME/github-user" --with-decryption 2>/dev/null | jq '.Parameter.Value' )" > $HOME/.devcontainers.env
echo "GITHUB_TOKEN=$(aws ssm get-parameter --name "/devcontainer/$PROJECT_NAME/github-token" --with-decryption 2>/dev/null | jq '.Parameter.Value' )">> $HOME/.devcontainers.env

export $(grep -v '^#' "$HOME/.devcontainers.env" | xargs)

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




