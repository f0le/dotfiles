#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

xset -dpms &
xset s off &
xset s noblank &
xset dpms 0 0 0 &
redshift -l 48.1:11.57 -t 6500:3800 -b 1.0:0.6 &
xrdb ~/.Xresources &
exec /usr/bin/awesome >> ~/.cache/awesome/stdout 2>> ~/.cache/awesome/stderr
