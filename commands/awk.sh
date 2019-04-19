#!/bin/bash

#---awk---
awk -F : '{print $1}' /etc/passwd
# Print only users with name takov
awk -F : '/takov/{print $1}' /etc/passwd 
# Print the first and the last field 
awk -F : '/takov/{print $1 $NF}' /etc/passwd
