#!/bin/bash

#---ssh---
ssh takov@10.10.10.10 # Create ssh session

#---sftp---
#Provide algorithm. Use it when some algorithm is deprecated by default and need to be expressly specified
#KexAlgorithms=diffie-hellman-group-exchange-sha256,diffie-hellman-group14-sha1,diffie-hellman-group1-sha1

sftp -oPort=222 -o KexAlgorithms=diffie-hellman-group14-sha1 -i keyName takov@10.10.10.10 

#Upload file in one line
sftp -oPort=222 -i keyName takov@10.10.10.10:/Folder/ <<< $'put file.txt'