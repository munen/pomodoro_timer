#!/bin/bash

LOGFILE=pomodoro_backlog.asc
POMODORO_TIME=5
BREAK_TIME=1

clear
echo "What is your activity for this pomodoro? "
read activity

function timer {
  clear
  let "limit = $1"
  counter=$limit
  echo = $2 =; echo
  echo "$counter minutes left...";
  sleep 1
  let "counter = $counter - 1"

  while [ $counter != 0 ]; do
    timer $counter "$2"
  done

  echo "Time's up!"
}

echo "Starting 25min pomodoro"
timer $POMODORO_TIME "$activity"
echo "Starting 5min break"
timer $BREAK_TIME Break

echo; echo -n "You have completed one pomodoro on: "
echo "$activity"

echo `date` "; $activity" >> $LOGFILE
echo; echo "Your pomodoro has been logged into:" $LOGFILE; echo
