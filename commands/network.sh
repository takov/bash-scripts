#!/bin/bash

#---netstat---
# Show the remote addresses of the connected clients. Result is sorted and only the unique IPs are shown. 
#Remove "state ESTABLESHED" of all state need to be observed 
netstat -nt state ESTABLESHED | awk '{ print $5 } ' |  cut -f1 -d":" | sort -u

#---ss---
ss -tan | awk '{print$5}' # Similar  as above command but without sorting 

#---lsof---
#Show which proccess is using port 8080
lsof -i:8080

#---nmap---
#Display the protocol type (TLS/SSL) and the supported cipher suites
nmap -sV --script ssl-enum-ciphers -p <port> <host> 
nmap -sV --script ssl-cert,ssl-enum-ciphers -p <port> <host>

#---wireshark---
#Monitor the traffic on remote machine
wireshark -i <(ssh takov@10.10.10.10 "tcpdump -s 0 -U -n -w - -i eth0 not port 22" ) -k  # eth0 is the name of the interface

#---wireshark---
#Limit the bandwidth of one or more network adapters
apt-get install wondershaper #Install the tool
wondershaper [interface] [downlink] [uplink] #syntax 
wondershaper eth0 200 200 #Example
wondershaper clear eth0 # Clear the limit