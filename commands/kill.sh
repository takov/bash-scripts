#!/bin/bash

#---kill---
#Kill all processes that contains foo word
ps -ef | grep foo | awk '{print $2}' | xargs kill -9

