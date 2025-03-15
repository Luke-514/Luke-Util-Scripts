#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 Threshold"
    exit 1
fi

THRESHOLD=$1

df -m | awk -v threshold=$THRESHOLD 'NR==1 || (NR>1 && gsub("%", "", $5) && $5+0 > threshold) {print $0}' | sed 's/Mounted on/Mounted_on/g'| column -t
