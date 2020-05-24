
#### LIST BUNDLES INSTALLED BY USERS ###
#Taken from ClearLinux Forum
#https://community.clearlinux.org/t/what-have-i-installed/4653/9?u=takov

#List only bundles installed by user
#sudo swupd bundle-list --status | grep "explicitly installed"

#List only bundles installed by user and add preffix "sudo swupd bundle-add.
sudo swupd bundle-list --status | grep "explicitly installed"|cut -c2-|cut -d" " -f2|xargs -I{} -P1 echo sudo swupd bundle-add {}
