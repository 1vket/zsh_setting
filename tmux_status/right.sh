#!/bin/bash

# time
echo_time () {
  #echo "$(date '+%H:%M %y-%m-%d')"
  echo `date '+%H:%M %y-%m-%d'`
}

# memory
memory () {
  echo `free -g | grep "^Mem:" | awk '{printf "%d/%d\n",$3,$2}'`
}

echo "`memory`G `echo_time`"
