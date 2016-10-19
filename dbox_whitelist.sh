#!/bin/bash

for f in /root/Dropbox/*; do
  OLDIFS="$IFS"
  export IFS=";"

  if [ "$f" != "/root/Dropbox/Media" ]
     then
         echo "excluding $f"
    dropbox exclude add "$f"
  else
      echo "not excluding $f"
    dropbox exclude remove "$f"
  fi

  export IFS="$OLDIFS"
done
