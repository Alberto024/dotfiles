#!/bin/sh

userresources=$HOME/.Xresources

# merge in defaults and keymaps
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#Remap caps Lock to Escape
xmodmap -e 'clear Lock'
xmodmap -e 'keycode 0x42=Escape'

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd

~/.fehbg &
redshift -c /home/nava/.config/redshift.conf &
xset r rate 200 30 &
thunar --daemon &
udiskie &
#xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 &

sxhkd &
exec bspwm
