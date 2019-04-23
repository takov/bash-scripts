#!/bin/bash

#Display everything from BaseDN
ldapsearch -x -LLL -h 10.10.10.10 -D "BindDN"  -w pass -b "BaseDN" -s sub -x "(objectclass=*)"

#-z limit   size limit (in entries, or "none" or "max") for search
ldapsearch -x -LLL -h 10.10.10.10 -D "BindDN"  -w pass -b "BaseDN" -s sub -x "(objectclass=*)" -z 10

#Display only the CN
ldapsearch  -x  -h 10.10.10.10 -D "BindDN"  -w pass -b "BaseDN" -s sub -x "(objectClass=*)"  | grep cn:

#Display the value of CN and sort it
ldapsearch  -x  -h 10.10.10.10 -D "BindDN"  -w pass -b "BaseDN" -s sub -x "(objectClass=*)"  | grep cn: | cut -d: -f2 | sort 

#With different search filter
ldapsearch -x  -h 10.10.10.10 -D "BindDN"  -w pass -b "BaseDN" -s sub -x "(&(objectClass=user)(displayName=takov))"

#list member of group
ldapsearch -x  -h 10.10.10.10 -D "BindDN"  -w pass -b "BaseDN" -s sub -x "(memberOf= CN=Group1,CN=Users,DC=takov,DC=com))"

#list member of group and object person
ldapsearch -x  -h 10.10.10.10 -D "BindDN"  -w pass -b "BaseDN" -s sub -x "(&(objectClass=person)(memberOf=CN=Group1,CN=Users,DC=takov,DC=com))"


# -d enable debug 1-Trace, 2-Packets, 4-Arguments, 32-Filters, 128-Access control
ldapsearch -d 1 -x -LLL -h 10.10.10.10 -D "BindDN"  -w pass -b "BaseDN" -s sub -x "(objectclass=*)"

# -v enable verbose mode 
ldapsearch -v -x -LLL -h 10.10.10.10 -D "BindDN"  -w pass -b "BaseDN" -s sub -x "(objectclass=*)"