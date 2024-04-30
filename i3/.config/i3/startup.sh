#!/usr/bin/env bash

# Set color temperature
redshift -P -O 3200

# Disable touchpad, change mouse sensitivity
xinput disable 'Elan Touchpad'
xinput set-prop 'USB Optical Mouse' 'libinput Accel Speed' -0.5
xinput set-prop 'USB Optical Mouse' 'libinput Accel Profile Enabled' 0, 1

# Fixing screen tear
xrandr --output eDP --set TearFree on

#Secondary monitor
xrandr --output HDMI-A-0 --auto --left-of eDP
# xrandr --output --rate 75

# Set wallpaper
feh --bg-scale /home/jatin/.config/i3/wallpaper.jpg
# killall xwinwrap
# xwinwrap -g 1366x768 -ov -ni -s -nf -- gifview -w WID /home/jatin/Downloads/birdcity.gif -a --no-interactive
#
# Start conky
killall conky
conky &
