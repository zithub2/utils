#!/bin/bash

# usage:
#   bak.sh [-s] FILE...
# desc:
#   backup files
# options:
#   -s silent
bakdir="bak-`date +%Y-%m-%d-%H-%M-%S`"
if [ "$1" == "-s" ]; then
  shift
  mkdir $bakdir && cp "$@" $bakdir
else
  mkdir $bakdir && cp "$@" $bakdir && ls -ld $bakdir && echo && ls -la $bakdir
fi
