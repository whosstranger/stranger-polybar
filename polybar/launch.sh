#!/usr/bin/env sh

## Add this to your wm startup file.

# Debug mode (set to 1 for debug) added by wildzarek
DEBUG=0

# Terminate already running bar instances
killall -q polybar

## Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

## Launch

## Left bar
polybar log -c ~/.config/polybar/current.ini &
polybar secondary -c ~/.config/polybar/current.ini &
polybar netstatus -c ~/.config/polybar/current.ini &
polybar htbstatus -c ~/.config/polybar/current.ini &
polybar htbtarget -c ~/.config/polybar/current.ini &

## Right bar
polybar top -c ~/.config/polybar/current.ini &
polybar primary -c ~/.config/polybar/current.ini &
polybar quinary -c ~/.config/polybar/current.ini &
polybar senary -c ~/.config/polybar/current.ini &
polybar volume -c ~/.config/polybar/current.ini &

## Center bar
polybar primary -c ~/.config/polybar/workspace.ini &
