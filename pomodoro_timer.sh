#!/bin/bash

LOGFILE=pomodoro_backlog.asc
POMODORO_TIME=25
BREAK_TIME=5

clear
echo "What is your activity for this pomodoro? "
read activity

# Recursive helper function showing current Action and time left
function timer {
  clear
  let "limit = $1"
  counter=$limit
  echo = $2 =; echo
  echo "$counter minutes left...";
  sleep 60
  let "counter = $counter - 1"

  while [ $counter != 0 ]; do
    timer $counter "$2"
  done
}

# Start Pomodoro
timer $POMODORO_TIME "$activity"

clear
echo "======================="
echo "~        BREAK        ~"
echo "======================="
echo; echo "Press [Enter] to continue"
read

timer $BREAK_TIME Break
echo; echo "Time's up!"

# User feedback
echo; echo -n "You have completed one pomodoro on: "
echo "'$activity'"

# Logging
echo `date` "; $activity" >> $LOGFILE
echo; echo "Your pomodoro has been logged into:" $LOGFILE; echo
