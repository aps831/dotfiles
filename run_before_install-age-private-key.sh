#! /bin/bash

AGE_PRIVATE_KEY_DIR="${HOME}/.age"
AGE_PRIVATE_KEY_FILE="${AGE_PRIVATE_KEY_DIR}/chezmoi.age.txt"

if [ -z "$AGE_PRIVATE_KEY" ]; then
  echo "AGE_PRIVATE_KEY is not set. Using private key from ${AGE_PRIVATE_KEY_FILE}"
else
  echo "AGE_PRIVATE_KEY is set. Writing private key to ${AGE_PRIVATE_KEY_FILE}"
  mkdir -p ${AGE_PRIVATE_KEY_DIR}
  echo -e "${AGE_PRIVATE_KEY}" > ${AGE_PRIVATE_KEY_FILE}
fi