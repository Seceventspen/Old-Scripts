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
# this stuff is worth it, you can buy me a beer in return.
# ----------------------------------------------------------------------------

####################################################################################
echo
echo "   _____       _   _           _____      _     _______ _           _   ";
echo "  / ____|     | | | |         / ____|    | |   |__   __| |         | |  ";
echo " | |  __  ___ | |_| |_ __ _  | |  __  ___| |_     | |  | |__   __ _| |_ ";
echo " | | |_ |/ _ \| __| __/ _\` | | | |_ |/ _ \ __|    | |  | '_ \ / _\` | __|";
echo " | |__| | (_) | |_| || (_| | | |__| |  __/ |_     | |  | | | | (_| | |_ ";
echo "  \_____|\___/ \__|\__\__,_|  \_____|\___|\__|    |_|  |_| |_|\__,_|\__|";
echo "   _____ _____ _         _____          _                               ";
echo "  / ____/ ____| |       / ____|        | |                              ";
echo " | (___| (___ | |      | |     ___ _ __| |_                             ";
echo "  \___ \\___ \| |      | |    / _ \ '__| __|                            ";
echo "  ____) |___) | |____  | |___|  __/ |  | |_ _                           ";
echo " |_____/_____/|______|  \_____\___|_|   \__(_)                          ";
echo "                                                                        ";
echo "                                                                        ";

####################################################################################

echo -en "\033[1;33mEnter Target Server/Domain Name:"
# Asks for the target server name in yellow text.
echo -en '\033[1;32m'
read var1
echo

echo
echo -e "\033[1;33mEnter Target Server IP:Port Number"
echo -e "\033[1;33mExample 8.8.8.8:443"
# Asks for the target server name and port number in yellow text then shows an example of format.
echo -en '\033[1;32m'
read var2

echo
echo -en "\033[1mProcessing ..."
echo
sleep .3
# Sleeping for 3 secs

echo
echo -en "\033[01;37mCertificate retrieved for \033[1;32m$var1\033[0m"
echo
sleep .2
# Sleeping for 1.5 secs

echo
echo
echo | openssl s_client -showcerts -servername $var1 -connect $var2 2>/dev/null | openssl x509 -inform pem -noout -text
# Retrieves Target server/Web Apllication SSL Cert. and displays in a nice format.
echo
echo
