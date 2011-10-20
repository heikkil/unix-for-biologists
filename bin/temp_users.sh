#!/bin/bash 

# This script creates N number of temporary logins 
# with a link to the course materials directory
# the passwd is always 'y' and expires immediately
#
# The script can remove users, too


BASE='student'

function usage() {
    echo "Usage: $0 create count"
    echo "   or: $0 remove"
    exit 1
}

# need sudo 
if [ `whoami` != "root" ]
then
    echo Run this script using sudo 
    exit 1
fi



function create() {
    USERCOUNT=$1
    echo now creating $USERCOUNT users: $BASE;

    for (( i=1 ; i<($USERCOUNT+1) ; i++ )); do
	LOGIN="$BASE$i"
	echo $LOGIN
	yes | adduser -home /home/$LOGIN $LOGIN
	passwd -e $LOGIN 
	ln -s /home/heikki/unix_course /home/$LOGIN
    done

}

function remove() {
    echo now removing $USERCOUNT users
    ls /home/ | grep $BASE | while read user;
    do
	userdel -r $user
	echo removed $user	
    done
}

case "$1" in
    'create')
	if [ "$#" -ne 2 ]; then usage ; fi
	echo create $2 users
	create $2
	echo
	;;
    'remove')
	echo remove $BASE* users
        #remove
	;;
    *)
	usage
esac
exit 0
