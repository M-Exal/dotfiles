#!/bin/bash
# Usage: brightness-control.sh [up|down]
STEP=0.05
CURRENT=$(xrandr --verbose | grep Brightness | awk '{print $2}')
if [ "$1" = "up" ]; then
    NEW=$(echo "$CURRENT + $STEP" | bc)
elif [ "$1" = "down" ]; then
    NEW=$(echo "$CURRENT - $STEP" | bc)
fi
xrandr --output eDP-1 --brightness $NEW

