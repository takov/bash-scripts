#!/bin/bash

#Usually only a limited range need to be scanned. That is why the script checks only the range after the last .
#TODO enhance to take the IP as arguments
#172.217.169.X - public IPs

for i in {194..196} # from-to
do ping -c1  172.217.169.$i > /dev/null && echo 172.217.169.$i is available; # "-c 1" is to send only 1 request
done
