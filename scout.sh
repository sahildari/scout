#!/usr/bin/bash

CYAN="\e[36m"
ENDCOLOR="\e[0m"
GREEN="\e[32m"
YELLOW="\e[33m"

## Introduction

mkdir -p output
echo -ne "${GREEN} [+] Hello fellow hackers ${ENDCOLOR}\n"

echo -ne "${YELLOW} [+] Specify the programming language ${ENDCOLOR}
1. ASP.Net
2. SpringBoot

(Enter 1 for ASP.Net and 2 for SpringBoot)\n"

read language

if [ $language -eq 1 ]
then
	## find password, private_key, session_key, headers(not present or commented),cookie attributes, http verbs
	#---find password,secret, token,sessionid, session_id,apikey,api_key,sessionkey,session_key in json
	find . -name \*.json -type f | while read line; do echo -ne "$line\n" >>jsonFile.txt;done 
	sort -u jsonFile.txt >> sortedJSON.txt;
	cat sortedJSON.txt| while read filename; do echo $filename;cat $filename | grep -in 'password\|secret\|token\|sessionid\|session_id\|apikey\|api_key\|session_key\|sessionkey';echo done;done |tee -a output/JSONoutput.txt
	# ---password,secret, token,sessionid, session_id,apikey,api_key,sessionkey,session_key in json
	#.config
	find . -name \*.config -type f | while read line; do echo "$line" | tee -a configFile.txt;done 
	sort -u configFile.txt >> sortedConfig.txt  
	cat sortedConfig.txt | while read filename; do echo $filename;cat $filename |grep -in 'x-xss-protection\|x-frame-options\|x-content\|strict-transport-policy\|content-security-policy\|referrer-policy\|debug\|put\|trace' | grep -iv '<\!--'; echo done;done | tee -a output/headers.txt
	clear
	echo -ne "${GREEN} [+] The sensitive data in the JSON files have been written to JSONoutput.txt ${ENDCOLOR}\n"
	echo -ne "${GREEN} [+] The sensitive data in the config files have been written to configOutput.txt ${ENDCOLOR}\n"
	echo -ne "${CYAN}Headers present in the config files:\n";cat output/headers.txt | grep -in 'x-xss-protection\|x-frame-options\|x-content\|strict-transport-policy\|content-security-policy\|referrer-policy'
	#.cs
 
	# springboot
	#.java
	#.xml
	#.java
fi

 