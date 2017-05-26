#!/bin/bash

timer() {
    local N=$1; shift

    (sleep $N && notify-send "TIMES UP" "${*:-BING}" -t 0) &
    echo "timer set for $N"
}
pomo() {
    local N=$1; shift
    echo "$N Pomodoro Cycles Set"
    (notify-send "$N Pomodoro Cycles Set" "Lets go..." -t 0 -u critical) &

    COUNTER=0
    while [ $COUNTER -lt $N ]; do
        (sleep $[$COUNTER*30]m && notify-send "YOU HAVE $[$N-$COUNTER] CYCLES LEFT" -t 0) &
        (sleep $[$COUNTER*30]m && notify-send "START WORKING" -t 0 && echo -e "\a") &
        (sleep $[$COUNTER*30+25]m && notify-send "TAKE A BREAK" -t 0 && echo -e "\a") &
        let COUNTER=COUNTER+1
    done
    (sleep $[$COUNTER*30]m && notify-send "YOU'RE DONE" "good job :)" -t 0 && echo -e "\a") &
}
