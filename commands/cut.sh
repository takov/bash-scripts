#!/bin/bash

#---cut---
# Print the third column of /etc/passwd file. "-f3" - 3rd column. "-d : " - delimiter :
cut -f3 -d : /etc/passwd
# Above command but sort the result. Use sort -n if you want to sort numbers
cut -f1 -d : /etc/passwd | sort | head
