
#!/bin/bash

###### NOTE!!!!###########
#Before installing opera please check this link
#https://community.clearlinux.org/t/ld-not-finding-library-installed-in-usr-local-lib/617/5
# You should add custom path to ld
# Also install lynx bundle
#sudo swupd bundle-add lynx

# Path to opera installation dir
opera_home=/home/user/software
# Path to custom lib dir
lib_dir=/usr/local/

# Base URLs to opera and ffmpeg
opera_base_url="https://rpm.opera.com/rpm/"
ffmpeg_chromium_url="https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/Extra/x86_64/"

# opera type - stable,developer,beta
opera_build=opera_stable

# Clear tmp dir and create if it doesn't exist
rm -rf tmp/*
mkdir -p tmp 

# Get latest opera link
opera_link=$(lynx -dump -listonly "${opera_base_url}" | grep $opera_build | awk '{print $2}' | sort | tail -n1 )

#Download opera and extract it
echo 'Downloading Opera latest build: ' $opera_link
wget -O - "${opera_link}" > tmp/opera_latest.rpm 

echo '##### Extracing Opera rpm package into ' $opera_home 'dir folder'
rpm2cpio tmp/opera_latest.rpm | cpio -D $opera_home -idmv

# Enable H.264 codecs 
#libffmpeg.so from chromium-ffmpeg-extra package  will be used to enable h.264 codecs
ffmpeg_link=$(lynx -dump -listonly "${ffmpeg_chromium_url}" | grep chromium-ffmpeg-extra-'[0-9][0-9]' | awk '{print $2}' | sort | tail -n1 )

echo 'Downloading ffmpeg lib from : ' $ffmpeg_link
wget -O - "${ffmpeg_link}" > tmp/ffmpeg_latest.rpm 

echo '##### Extracing ffmpeg rpm package into ' $opera_home 'dir folder'
rpm2cpio tmp/ffmpeg_latest.rpm | cpio -D $opera_home -idmv

#clear binaries
rm -rf tmp

### Create some dirs under local lib folder
sudo mkdir -p $lib_dir/share/pixmaps
sudo mkdir -p $lib_dir/share/applications
sudo mkdir -p $lib_dir/share/mime
sudo mkdir -p $lib_dir/share/mime/packages
sudo mkdir -p $lib_dir/share/doc
sudo mkdir -p $lib_dir/share/doc/packages
sudo mkdir -p $lib_dir/share/doc/packages/chromium-ffmpeg-extra
sudo mkdir -p $lib_dir/share/icons
sudo mkdir -p $lib_dir/share/icons/hicolor
sudo mkdir -p $lib_dir/share/icons/hicolor/256x256
sudo mkdir -p $lib_dir/share/icons/hicolor/256x256/apps
sudo mkdir -p $lib_dir/share/icons/hicolor/16x16
sudo mkdir -p $lib_dir/share/icons/hicolor/16x16/apps
sudo mkdir -p $lib_dir/share/icons/hicolor/32x32
sudo mkdir -p $lib_dir/share/icons/hicolor/32x32/apps
sudo mkdir -p $lib_dir/share/icons/hicolor/48x48
sudo mkdir -p $lib_dir/share/icons/hicolor/48x48/apps
sudo mkdir -p $lib_dir/share/icons/hicolor/128x128
sudo mkdir -p $lib_dir/share/icons/hicolor/128x128/apps

# Create soft links
# This will make opera icon avaialbe in the search and in the panel
sudo ln -s $opera_home/share/pixmaps/opera.xpm $lib_dir/share/pixmaps/
sudo ln -s $opera_home/share/applications/opera.desktop $lib_dir/share/applications/
sudo ln -s $opera_home/share/mime/packages/opera-stable.xml $lib_dir/share/mime/packages/
sudo ln -s $opera_home/share/doc/packages/chromium-ffmpeg-extra/AUTHORS $lib_dir/share/doc/packages/chromium-ffmpeg-extra/
sudo ln -s $opera_home/share/doc/packages/chromium-ffmpeg-extra/LICENSE $lib_dir/share/doc/packages/chromium-ffmpeg-extra/
sudo ln -s $opera_home/share/icons/hicolor/256x256/apps/opera.png $lib_dir/share/icons/hicolor/256x256/apps/
sudo ln -s $opera_home/share/icons/hicolor/16x16/apps/opera.png $lib_dir/share/icons/hicolor/16x16/apps/
sudo ln -s $opera_home/share/icons/hicolor/32x32/apps/opera.png $lib_dir/share/icons/hicolor/32x32/apps/
sudo ln -s $opera_home/share/icons/hicolor/48x48/apps/opera.png $lib_dir/share/icons/hicolor/48x48/apps/
sudo ln -s $opera_home/share/icons/hicolor/128x128/apps/opera.png $lib_dir/share/icons/hicolor/128x128/apps/
