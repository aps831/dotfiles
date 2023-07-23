#! /bin/bash

AGE_PRIVATE_KEY_FILE="${HOME}/.age/chezmoi.age.txt"

if [ -z "$AGE_PRIVATE_KEY" ]; then
  echo "AGE_PRIVATE_KEY is not set. Using private key from ${AGE_PRIVATE_KEY_FILE}"
else
  echo "AGE_PRIVATE_KEY is set. Writing private key to ${AGE_PRIVATE_KEY_FILE}"
  echo ${AGE_PRIVATE_KEY} > ${AGE_PRIVATE_KEY_FILE}.test
fi