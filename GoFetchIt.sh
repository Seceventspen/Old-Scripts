#!/bin/bash
#
# Really Really Simple Bash Script Written by AlternativeSec.
# Don't hate on me too much!
#
# ----------------------------------------------------------------------------
# "THE BEER O'CLOCK LICENSE" (Version 0.1):
# <seceventspen@alternativesec.xyz> wrote this file.
# As long as you retain this notice you can do
# whatever you want with this stuff. If we meet some day, and you think
# this script is worth it, you can buy me a beer in return.
# ----------------------------------------------------------------------------

echo
echo "   ___          ___    _       _       _ _           ";
echo "  / _ \___     / __\__| |_ ___| |__   (_) |_         ";
echo " / /_\/ _ \   / _\/ _ \ __/ __| '_ \  | | __|        ";
echo "/ /_\\ (_) | / / |  __/ || (__| | | | | | |_   _ _ _ ";
echo "\____/\___/  \/   \___|\__\___|_| |_| |_|\__| (_|_|_)";
echo "                                                     ";
echo "By AlternativeSec"
echo

echo
echo -en "\033[1;33mEnter Target Domain Name: "
# Asks the user for the target server name in yellow text.
echo -en '\033[1;32m'
read var1
echo

echo -en "\033[1mResolving ...\033[0m"
echo
sleep .3
# Sleeps process for 2 secs.

echo
host $var1
# Runs 'host' command on domain name to resolve an IP address and MX hosts.

echo
echo -en "\033[1;33mGetting Target Domain WhoIs info: \033[1;32m$var1 "
echo
# Retrieves the target domain WhoIS info in yellow text.
#echo -en '\033[1;32m'
#read var1

echo
echo -en "\033[1;32mProcessing ...\033[0m"
echo
sleep .3
# Sleeps process for 2 secs.

echo
whois $var1
#Runs 'whois' command against resolved IP, outputs in white text.

echo
echo -en "\033[1;33mGetting Target Domain DIG info: \033[1;32m$var1 "
echo
# Tells the user the script is retrieving the target domain/IP info in yellow text.

echo
echo -en "\033[1;32mProcessing ...\033[0m"
echo
sleep .3
# Sleeps process for 2 secs.

echo
dig -t any $var1
#Runs 'dig -t any' command against resolved IP, outputs in white text.

echo
echo -en "\033[1;33mGetting Target Domain raw HTTP Headers: \033[1;32m$var1 "
echo
# Retrieves the target domain/IP info in yellow text.

echo
echo -en "\033[1;32mProcessing ...\033[0m"
echo
sleep .3
# Sleeping for 2 secs.

echo
curl -LIN $var1
#Runs 'curl -LIN' command against domain name, outputs in white text.

echo
echo -en "\033[1;33mRetrieveing Target SSL Cert: \033[1;32m$var1 "
echo
# Tells user that the script retrieves the target domain/IP info in yellow text.

echo
echo -en "\033[1;32mProcessing ...\033[0m"
echo
sleep .3
# Sleeps process for 2 secs.

echo
var2=$(host $var1 | grep -o '[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*')

echo | openssl s_client -showcerts -servername $var1 -connect $var2:443 2>/dev/null | openssl x509 -inform pem -noout -text
# Retrieves Target server/Web Apllication SSL Cert. and displays in a nice format.
echo
echo
