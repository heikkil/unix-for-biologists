#!/bin/bash
# example3_if.sh
COUNTER=3
if [ $COUNTER -lt 1 ]; then
    echo zero
else
    echo big counter: $COUNTER
fi
