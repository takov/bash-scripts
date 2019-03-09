#!/bin/bash
#Define some colors
RED='\033[0;31m'
GREEN='\e[32m'
NC='\033[0m' 

account=$1

until users | grep -i $account > /dev/null
do
    echo -e "$RED Account [$account] is not logged yet. $NC"
    sleep 1
done

echo -e "$GREEN Account [$account] has just logged in. $NC"
## Both can be used.
#mail -s "Account [$account] has just logged in" root < .
echo "Subject: Account [$account] has just logged in" | sendmail  root

