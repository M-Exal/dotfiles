#!/usr/bin/env bash

# Terminate already running bar instances
polybar-msg cmd quit

# Log and launch bars
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log

# Modify the paths to point to your actual polybar config file
# polybar power --config=~/.config/polybar/config.ini 2>&1 | tee -a /tmp/polybar1.log & disown
polybar main --config=~/.config/polybar/config.ini 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."
