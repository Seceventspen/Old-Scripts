#!/bin/bash
#
# Really Really Simple Bash Script Written by AlternativeSec to check
# Whether a host/Service/Domain and Port is Up-or-Down
# Don't hate on me too much!
#
# ----------------------------------------------------------------------------
# "THE BEER O'CLOCK LICENSE" (Version 0.1):
# <seceventspen@alternativesec.xyz> wrote this file.
# As long as you retain this notice you can do
# whatever you want with this stuff. If we meet some day, and you think
# this stuff is worth it, you can buy me a beer in return.
# ----------------------------------------------------------------------------
echo "                                               ";
echo " _____                     ____                ";
echo "|  |  |___ ___ ___ ___ ___|    \ ___ _ _ _ ___ ";
echo "|  |  | . |___| . |  _|___|  |  | . | | | |   |";
echo "|_____|  _|   |___|_|     |____/|___|_____|_|_|";
echo "      |_|                                      ";
echo "By AlternativeSec"
echo
echo -e "\033[1;33mEnter Target IP or Domain"
# Asks for the target server name and port number in yellow text.
echo -en '\033[1;32m'
read var1
# Reads and stores the input
echo
echo -e "\033[1;33mEnter Port Number"
# Asks for the target port number in yellow text.
echo -en '\033[1;32m'
read var2
# Reads and stores the input
echo
echo -en "\033[1;33mStarting Up-or-Down for checks: \033[1;32m$var1:$var2\033[0m"
echo
while (true);do ncat --ssl -z -w3 $var1 $var2 > /dev/null && echo -e "Service is up" || echo -e "Service is down"; sleep 1; done
# Uses Ncat to make a connection, checks whether host:port is up-or-down, echos state to screen, waits 3 secs before reconnecting.
# Runs in a continuos loop until manually stopped.

#while (true); do nc -vv -z -w3 $var1 $var > /dev/null && echo -e "Service is up" || echo -e "Service is down"; sleep 1; done
# Uses netcat (nc) to make a connection, checks whether host:port is up-or-down, echos state to screen, waits 3 secs before reconnecting.
# Runs in a continuos loop until manually stopped.
