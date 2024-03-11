#!/bin/bash
sinks=$(pactl list sinks |grep "Name: "|awk -F "Name: " '{print $2}')
current_sink=$(pactl get-default-sink)
i_current_sink=0
for sink in $sinks; do
    if [ $sink == $current_sink ]; then
        break
    fi
    i_current_sink=$((i_current_sink+1))
done

i_next_sink=$((i_current_sink+1))
n_sinks=$(echo $sinks | wc -w)
if [ $i_next_sink -gt $((n_sinks-1)) ]; then
    i_next_sink=0
fi
i_current_sink=0
for sink in $sinks; do
    if [ $i_next_sink -eq $i_current_sink ]; then
        notify-send "Sink: $sink" -t 1 -r 1
        pactl set-default-sink $sink
    fi
    i_current_sink=$((i_current_sink+1))
done
