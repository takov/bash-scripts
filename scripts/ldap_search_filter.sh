#!/bin/bash
RED='\033[0;31m'
NC='\033[0m' # No Color

HOSTNAME=10.10.10
PORT=389
BINDDN="cn=Administrator,cn=Users,dc=Takov,dc=com"
PASS="123"
BASEDN="cn=Users,dc=Takov,dc=com"


#Check if first parameter is empty. If yes prompt the user to enter filter
if [ -z $1 ]
then
    echo -e "Enter search filter e.g (objectclass=*) :"
    read filter
else
    filter="$1"
fi


echo "Choose what to be displayed"
select INPUT in 'All' 'CNs only'
do
    case $REPLY in
            1) INPUT='';;
            2) INPUT='grep cn: ';;
            *) echo -e "${RED}ERROR${NC}"  && exit 2;;
    esac

if [[ -n "$INPUT" ]]
then
    clear
  ldapsearch -x -LLL -h $HOSTNAME -p $PORT -D $BINDDN  -w $PASS -b $BASEDN -s sub -x $filter | $INPUT
    break
else
   clear
  ldapsearch -x -LLL -h $HOSTNAME -p $PORT -D $BINDDN  -w $PASS -b $BASEDN -s sub -x $filter
    break
fi
done



 