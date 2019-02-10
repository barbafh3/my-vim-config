#!/usr/bin/env bash

kill -9 -$(ps -o pgid -p $(cat ~/.config/polybar/scripts/arch/arch_updates.pid) | tail -n1 | sed 's/^[ \t]*//;s/[ \t]*$//')
# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar right &

echo "Bars launched..."
