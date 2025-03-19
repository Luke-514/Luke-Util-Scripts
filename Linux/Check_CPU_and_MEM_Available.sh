#!/bin/bash

CPUIDLE=`top -b -n 1 | grep Cpu | awk -F "," '{print $4}' | tr -d ' id'`
MEMAVAILABLE=`free $1 | awk '{print $7}' | grep -Ev ^$`
SWAPAVAILABLE=`free $1 | grep Swap | awk '{print $4}'`

echo "CPU  IDLE     : "$CPUIDLE
echo "MEM  Available: "$MEMAVAILABLE
echo "SWAP Available: "$SWAPAVAILABLE
