#!/bin/bash

USR=$1
DOM=$1
VMAILHOME="/home/vmail"
# Where is the '@' symbol ?
ATP=`expr index "$1" @`

# copy substring from index 0 to position of '@' minus one
USR=${USR:0:ATP-1}
# copy substring starting from one after position of '@'
DOM=${DOM:ATP}
# use proper muttrc if exists
MUTTSWITCH=""

FILE="${VMAILHOME}/${USR}/.muttrc"

if [ -f $FILE ];
then
   MUTTSWITCH=" -F ${FILE}"
fi



# call mutt on the virtual doman / virtual user email account
mutt -f /home/vmail/$DOM/$USR/Maildir/ $FILE