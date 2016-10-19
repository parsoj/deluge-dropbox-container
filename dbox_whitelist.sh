#!/bin/bash

EXCLUSIONS="" # this will contain the files/folders to be excluded
WHITELIST="Media" # files and folders you wish to whitelist

for f in *; do
  OLDIFS="$IFS"
  export IFS=";"
  
  for w in $WHITELIST; do
    if [ "$f" != "$w" ]; then
      dropbox exclude add "$e"
    fi
  done

  export IFS="$OLDIFS"
done
