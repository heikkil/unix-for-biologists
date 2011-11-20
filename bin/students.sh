#!/bin/bash 

# when run on the remote computer with student accounts, this script
# creates a listing of all students from a file ~/name:
#
# full name
# KAUST ID
#

for LOGIN in $(ls /home/ | grep student ); do
    if [ -e /home/$LOGIN/identity ]; then
	echo \#---------------
	echo $LOGIN
	cat /home/$LOGIN/identity
    fi
done
