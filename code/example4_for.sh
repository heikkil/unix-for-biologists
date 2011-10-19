#!/bin/bash
# example4_for.sh

# for
for i in  1 2 3 ; do
    echo $i
done

# for each file
for i in $(ls); do
    echo -n -
#    echo $i
done

# for oneliner 
for i in $(ls); do echo $i;  done
