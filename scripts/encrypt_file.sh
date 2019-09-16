#!/bin/bash

if [[ -z $2 ]]; then
    read -r -s -p "Encryption Passcode: " pswd
else
    pswd=$2
fi

echo "${pswd}" | gpg --batch --yes --symmetric --cipher-algo AES256 --passphrase-fd 0 "${1}"
