#!/bin/bash

export AWS_PROFILE="andrew-p-spratley"

PATH_USER="/devcontainer/$PROJECT_NAME/github-user"
PATH_TOKEN="/devcontainer/$PROJECT_NAME/github-token"

aws sso login
echo "GITHUB_USER=$(aws ssm get-parameter --name "$PATH_USER" --with-decryption | jq '.Parameter.Value' )" > $HOME/.devcontainers.env
echo "GITHUB_TOKEN=$(aws ssm get-parameter --name "$PATH_TOKEN" --with-decryption | jq '.Parameter.Value' )">> $HOME/.devcontainers.env


