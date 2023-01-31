#!/usr/bin/bash

CYAN="\e[36m"
ENDCOLOR="\e[0m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
RED="\e[31m"

if [ "$EUID" -ne 0 ]
then
	echo -ne "${RED}Please Run this script as root${ENDCOLOR}"
	exit $1
else
	chmod +x *.sh
	DIFF=$(diff scout.sh /usr/local/bin/scout)
	scoutPresent=$(command -v scout)
	if [ $(scoutPresent) > /dev/null ] && [ "$DIFF" != "" ]
	then
		echo -ne "${RED}[-] Another scout is already present in $(scoutPresent)${ENDCOLOR}"
		echo -ne "${RED}[-] If you wish to copy scout to your path make changes in LineNumber 16 or manually enter the following command\n\nsudo cp socut.sh /usr/local/bin/fileNameYouWantToGive${ENDCOLOR}"
	else
		sudo cp scout.sh /usr/local/bin/scout
		echo -ne "${GREEN}[+] The scout tool is installed and can be run from anywhere now\n\n${ENDCOLOR}"
		echo -ne "${BLUE}[+] Usage: Navigate to directory containing the source and run the following command:${ENDCOLOR}\n\n${YELLOW}cd /path/to/source/code\nscout${ENDCOLOR}" 
	fi	
fi
