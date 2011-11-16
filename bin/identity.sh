#! /bin/bash
#
#  identity.sh
#
#  Interactive bash program to store user information into the home
#  directory
#
#  Heikki Lehvalaiho, 2011 
#

# output file
FILE=$HOME/identity

# loop until affirmative
REPLY=""
until [[ $REPLY == "y" ]]; do

    # read the input
    echo
    echo -n "Give you full name: "
    read NAME
    echo -n "Give you KAUST ID: "
    read ID

    # give feedback
    echo
    echo "--------------------------------------"
    echo "    Name = $NAME"
    echo "      ID = $ID"
    echo "--------------------------------------"

    # ask for confirmation
    echo -n "Is this OK [y] :"
    read REPLY
    if [[ $REPLY == "" ]]; then
	REPLY="y"
    fi

done

# store the results
echo "Name = $NAME" > $FILE
echo "ID = $ID" >> $FILE
echo "Written into $FILE"
echo 

exit 0
