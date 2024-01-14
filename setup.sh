#!/bin/bash

apt-get update && apt-get install -y wget bzip2

wget https://downloads.getmonero.org/linux64

archive="linux64"

folder_inside=$(tar -tjf "$archive" | grep -o '^[^/]\+' | head -n 1)

if [ -n "$folder_inside" ]; then
    tar --strip-components=1 -xjvf "$archive" "$folder_inside"
    echo "Extracted '$folder_inside' without its parent directory."
else
    echo "No folder found inside the archive."
fi
