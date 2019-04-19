#!/bin/bash

iptables -F # Clear all iptables rules
#Accept up to 5 connection on port 21
iptables -A OUTPUT -p tcp -m tcp -m multiport --dports 21 -m connlimit --connlimit-upto 5 --connlimit-mask 32 -j ACCEPT
#Log all connections above 5 and with state NEW
iptables -A OUTPUT -p tcp -m tcp -d $ip -m state --state NEW -j LOG  --log-prefix "[IPTABLE]: "
