#!/bin/bash
#### WORK IN PROGRESS### NOT TESTED !!!! ####

#PS4='$LINENO: '
#set -x

DEST=/home/$USER/software/vscode
VERSION_FILE=${DEST}/.version
REMOTE_VERSION=
USR_LOCAL=/usr/local/share

echo Visual Studio Code updater


LOCAL_VERSION="none" && [ -f $VERSION_FILE ] && LOCAL_VERSION=$(cat $VERSION_FILE)
echo -e "Local version\t: $LOCAL_VERSION"

#Check version on remote
REMOTE_VERSION=$(curl -s -L https://code.visualstudio.com/updates | grep -Po '(?<=strong\>Update )[^:]+' | grep -oP '[^</strong>]+')
echo -e "Remote version\t: $REMOTE_VERSION"

if [ "$REMOTE_VERSION" == "$LOCAL_VERSION" ]; then
  echo "No update available"
  exit
fi

read -sp "Enter to update, Ctrl-C to abort... " && echo

echo Downloading ...
TMPWORK=$(mktemp -d)
cd $TMPWORK
wget -q --show-progress https://update.code.visualstudio.com/latest/linux-rpm-x64/stable -O code_${REMOTE_VERSION}_rpm_latest.rpm

echo "Clearing: " $DEST
rm -rf $DEST/*
echo '##### Extracing vscode rpm package into ' $DEST 'dir folder'
rpm2cpio code_${REMOTE_VERSION}_rpm_latest.rpm | cpio -D $DEST -idmv

sed -e "s%/usr/share/code/code%${DEST}/usr/share/code/code%" -e "s%Icon=com.visualstudio.code%Icon=${DEST}/usr/share/pixmaps/com.visualstudio.code.png%" ${DEST}/usr/share/applications/code.desktop


if [ -L ${USR_LOCAL}"/code" ] ; then
   if [ -e ${USR_LOCAL}"/code" ] ; then
      echo "Link to "${USR_LOCAL}"/code exist. Skipping..."
   else
      echo "Creating symlink "$DEST"/usr/share/code"
      sudo ln -s $DEST"/usr/share/code" ${USR_LOCAL}"/"
   fi
fi

  if [ -L ${USR_LOCAL}"/applications/code.desktop" ] ; then
    if [ -e ${USR_LOCAL}"/applications/code.desktop" ] ; then
        echo "Link to "${USR_LOCAL}"/applications/code.desktop exist. Skipping..."
    else
         echo "Creating symlink "$DEST"/applications/code.desktop"
        sudo ln -s $DEST"/applications/code.desktop" ${USR_LOCAL}"/applications/"
    fi
  fi

if [ -L ${USR_LOCAL}"/applications/code-url-handler.desktop" ] ; then
   if [ -e ${USR_LOCAL}"/applications/code-url-handler.desktop" ] ; then
      echo "Link to "${USR_LOCAL}"/applications/code-url-handler.desktop exist. Skipping..."
   else
       echo "Creating symlink "$DEST"/applications/code-url-handler.desktop"
      sudo ln -s $DEST"applications/code-url-handler.desktop" ${USR_LOCAL}"/applications/"
   fi
fi


if [ -L ${USR_LOCAL}"/pixmaps/com.visualstudio.code.png" ] ; then
   if [ -e ${USR_LOCAL}"/pixmaps/com.visualstudio.code.png" ] ; then
      echo "Link to "${USR_LOCAL}"/pixmaps/com.visualstudio.code.png exist. Skipping..."
   else
      echo "Creating symlink "$DEST"/pixmaps/com.visualstudio.code.png"
      sudo ln -s $DEST"/pixmaps/com.visualstudio.code.png" ${USR_LOCAL}"/pixmaps/"
   fi
fi

#Store version
echo $REMOTE_VERSION > $VERSION_FILE

cd
rm -rf $TMPWORK
echo Done.

[ $(pgrep -c -f ${DEST}/usr/share/code/code) -gt 0 ] && echo "Restart Visual Studio Code to use the latest version."
