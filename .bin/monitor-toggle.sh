#!/bin/bash
intern=eDP-1
extern=HDMI-2

if xrandr --listactivemonitors | grep "$extern"; then
    xrandr --output "$extern" --off --output "$intern" --auto
else
    xrandr --output "$intern" --auto --output "$extern" --auto
fi
