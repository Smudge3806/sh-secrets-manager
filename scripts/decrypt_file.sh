#!/bin/bash

FILE=$1
ORIGINAL_FILE=$(echo $FILE | awk '{$0=substr($0,1,length($0)-4); print $0}');

gpg --quiet --batch --yes --decrypt --output $ORIGINAL_FILE $FILE
