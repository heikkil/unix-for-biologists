#!/bin/bash
# example5_whileuntil.sh
COUNTER=3
while [ $COUNTER -gt 0 ]; do
    echo $COUNTER
    let COUNTER=$COUNTER-1
done
COUNTER=3
until [ $COUNTER -lt 1 ]; do
    echo $COUNTER
    let COUNTER-=1
done
