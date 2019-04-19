#!/bin/bash

#---sort---
# Show files sizes and sort them
du -h ~/Documents/ | sort -n
# Sort the 3rd column of /etc/passwd file. "-k3" specify column. "-t :" - delimiter :
sort -n -k3 -t : /etc/passwd

