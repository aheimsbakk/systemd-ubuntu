#!/bin/bash
#
# Install extra packages defined in environment variable APT

if [ ! -z "$APT" ] 
then
    apt-get update 
    for i in $(echo "$APT" | sed 's/,/ /g') 
        do apt-get install -y $i 
    done 
    apt-get clean
fi

exec "$@"
