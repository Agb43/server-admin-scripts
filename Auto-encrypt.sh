#!/bin/bash

cd ###path to files withe sensitive files#### || exit 1
filestoencrypt=($( ls ))
for file in "${filestoencrypt[@]}"; do
  if [[ "$file" != "*.gpg" ]]; then
    gpg --encrypt --recipient ####email corresponding to public key### "$file" && if [[ "$file" != "*.gpg" ]]; then rm "$file"
  fi
  fi

done
