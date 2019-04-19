#!/bin/bash

#---find---
find /etc -name *pass*  # Find all files under /etc dir that contains pass in their names
find . -type f -exec rm -ivf {} \; # Delete only the files under the current dir and all sub dirs


