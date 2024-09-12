#!/bin/bash
xrandr --verbose | grep Brightness | awk '{print $2 * 100 "%"}'

