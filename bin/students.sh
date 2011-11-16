#!/bin/bash 

# When run on the remote computer with student accounts, this script
# creates a listing of all students from a file ~/identity:
#
# full name
# KAUST ID
#

for LOGIN in $(ls /home/ | grep student ); do
    echo \#---------------
    echo $LOGIN
    cat /home/$LOGIN/identity
done
