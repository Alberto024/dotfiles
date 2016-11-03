#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

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

#feh --bg-scale /home/nava/Pictures/doge.png
~/.fehbg &
redshift -c /home/nava/.config/redshift.conf &
xset r rate 200 30 &
thunar --daemon &
udiskie &

sxhkd &
exec bspwm
