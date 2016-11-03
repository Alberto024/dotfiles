#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\[\033[0;36m\]╔═(\[\033[0m\033[0;36m\]\u\[\033[0m\]@\[\033[0;32m\]\h\[\033[0m\033[0;36m\])────(\[\033[0m\]\t \d\[\033[0;36m\])────(\[\033[0m\]\w\[\033[0;36m\])\n\[\033[0;36m\]╚═[ \[\033[0m\033[0;36m\]\$\[\033[0m\033[0;36m\]]>\[\033[0m\] '

set -o vi

#alias proj="cd /home/tree/projects/java"

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

alias ls='ls --color=auto'
alias l='ls -CF'
alias ssh1='ssh -Y -C -c blowfish-cbc,arcfour anava@134.197.35.88'
alias sftp1='sftp anava@134.197.35.88'
alias R="R --quiet"
alias vi="vim"
alias dlpoly="orterun -np 4 /home/nava/Downloads/dl_class_1.9/execute/DLPOLY.X"
alias dlg="java -jar /home/nava/Downloads/dl_class_1.9/java/GUI.jar $1 &"
alias vmd1="vmd -nt -dlpolyhist"

export PATH=$PATH:/home/nava/.config/bspwm/panel:/usr/local/bin/xcrysden-1.5.60-bin-semishared:/home/nava/bin
export EDITOR="vim"
