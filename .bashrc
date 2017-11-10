#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\[\033[0;36m\]╔═(\[\033[0m\033[0;36m\]\u\[\033[0m\]@\[\033[0;32m\]\h\[\033[0m\033[0;36m\])────(\[\033[0m\]\D{%D %I:%M:%S}\[\033[0;36m\])────(\[\033[0m\]\w\[\033[0;36m\])\n\[\033[0;36m\]╚═[ \[\033[0m\033[0;36m\]\$\[\033[0m\033[0;36m\]]>\[\033[0m\] '

#BASE16_SHELL=$HOME/.config/base16-shell/
#[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

set -o vi

alias ls='ls -CF --color=always'
alias l='ls -CF'
alias ssh1='ssh -Y -C -c blowfish-cbc,arcfour anava@134.197.35.88'
alias sftp1='sftp anava@134.197.35.88'
alias R="R --quiet"
alias vi="vim"
alias dlpoly="orterun -np 4 /home/nava/Downloads/dl_class_1.9/execute/DLPOLY.X"
alias dlg="java -jar /home/nava/Downloads/dl_class_1.9/java/GUI.jar $1 &"
alias vmd1="vmd -nt -dlpolyhist"
alias latexmake="latexmk -pvc -pdf main.tex"
alias xelatexmake="latexmk -xelatex -pvc  main.tex"
alias xelatexcodemake="latexmk -xelatex -pvc -shell-escape main.tex"
alias pacman="pacman --color=always"
alias pacaur="pacaur --color=always"
alias r="ranger"

source /home/nava/Project/Gromacs/gromacs/bin/GMXRC

export PATH=$PATH:/home/nava/.config/bspwm/panel:/usr/local/bin/xcrysden-1.5.60-bin-semishared:/home/nava/bin:/usr/local/gromacs/gromacs-5.1.4/bin:/home/nava/Project/dl_meso/DPD:/home/nava/Project/dl_meso/DPD/utility
export PYTHONPATH=$PYTHONPATH:/home/nava/Project/gsd/build:/home/nava/Project/hoomd-blue/build
export EDITOR="vim"
