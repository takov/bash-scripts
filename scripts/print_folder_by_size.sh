#!/bin/bash

#Initialize some variables
RED='\033[0;31m'
GREEN='\e[32m'
YELLOW='\e[33m'
NC='\033[0m' 

#Check if first parameter is empty. If yes prompt the user to enter directory
if [ -z $1 ]
then
    echo -e "Enter directory:"
    read dir
else
    dir=$1
fi

#If the directory is valid print the size of the files sorted.
if [ -d $dir ]
then
#TODO sort the result in human readable format
 result=$(du $dir | sort -nr )
 echo -e "$RED$result " | awk 'NR<=10' 
 echo -e "$YELLOW" ## TODO add YELLOW color in the echo below.
 echo -e "$result $NC" | awk 'NR>11'
echo -e "$NC"
else
    echo -e "$RED [ $dir ] is not a directory. Please enter valid directory!!! $NC"
    exit 1
fi