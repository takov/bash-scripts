#!/bin/bash

#If .mozilla/plugins doesn't exist you can create it
plugin_home=/home/$USER/.mozilla/plugins
base_url=https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/Essentials/x86_64/


#Create and clear tmp folder
mkdir -p tmp
rm -rf tmp/*

#Get url for latest flash plugin 
flash_link=$(lynx -dump -listonly "${base_url}" | grep flash-player-'[0-9][0-9]' | awk '{print $2}' | sort | tail -n1 )

wget -O - "${flash_link}" > tmp/flash_latest.rpm 

echo '##### Extracing ffmpeg rpm package into tmp dir folder'
rpm2cpio tmp/flash_latest.rpm | cpio -D tmp/ -idmv
#Just copying the libflashplayer.so does the trick to enable Flash for Firefox. 

echo '##### Copying libflashplayer.so to '$plugin_home
cp tmp/usr/lib64/browser-plugins/libflashplayer.so $plugin_home/

echo '### Restart firefox browser#######'

#clear binaries
rm -rf tmp
