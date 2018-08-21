#!/bin/bash
#
# Really Really Simple Bash Script Written by AlternativeSec to check
# to base64 encode and decode user input
# Don't hate on me too much!

# Base64 encode script
echo -e "\033[1;33mEnter data to encode"
# Asks for the user to input the date to encode in yellow text.
echo -en '\033[1;32m'
read var1
# Reads and stores the input
echo
echo -n $var1 | base64
# encodes user string in base64
echo


# Base64 decode script
echo -e "\033[1;33mEnter data to decode"
# Asks for the user to input the date to decode in yellow text.
echo -en '\033[1;32m'
read var2
# Reads and stores the input
echo
echo -n $var2  | base64 -D
# note: if using on a mac you need to pass the -D flag. For linux change to -d.
echo
echo
