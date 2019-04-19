#!/bin/bash

#---sed---
sed -n 5p /etc/passwd - Print line 5
# Delete the 5th line
sed -i -e '5d' test - Delete line 5
# Print the 1st column of a file
