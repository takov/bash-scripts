1. Download terminator from https://rpmfind.net/linux/rpm2html/search.php?query=terminator&submit=Search+...
2. Check this site: https://community.clearlinux.org/t/ld-not-finding-library-installed-in-usr-local-lib/617/5
3. Create startup script using the commands below:
-----------------------------------------------------------------------
#!/bin/bash

TERMINATOR_HOME=$HOME/software/terminator

#Fix: Not loading if its python path is not exported
export PYTHONPATH=$TERMINATOR_HOME/lib/python3.8/site-packages

#Fix for https://bugs.launchpad.net/terminator/+bug/1318542 --Comment 55
DBUS_SESSION_BUS_ADDRESS=''
$TERMINATOR_HOME/bin/terminator
---------------------------------------------------------------------------


4. Startup: Create symlink in /usr/local/bin pointing to the startup script created in point 3
5. Desktop icon: Create symlink in /usr/local/share/applications pointing to $TERMINATOR_HOME/share/applications/terminator.desktop
5. Icon image: Create symlink it /usr/local/share/pixmaps pointing to $TERMINATOR_HOME/share/pixmaps/terminator.png
