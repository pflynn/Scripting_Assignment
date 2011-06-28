#!/bin/bash

if [ -n "$1" ]
# If command-line argument is present (non-empty), do the following.
then
  lines=$1
  echo "arg"
else  
# If command-line argument is not present (empty), do the following.
  lines=$LINES # Default, if not specified on command-line.
  echo "no arg"
fi  
