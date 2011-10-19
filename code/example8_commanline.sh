#!/bin/bash
# example8_commandline.sh
if [ -z "$1" ]; then 
    echo usage: $0 directory
    exit
fi
if [ -d "$1" ]; then
    ls "$1"
else
    echo "$1" is not a valid directory
fi
