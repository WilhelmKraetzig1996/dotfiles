#!/bin/bash
sources=$(pactl list sources |grep "Name: "|awk -F "Name: " '{print $2}'| grep -v "monitor")
current_source=$(pactl get-default-source)
i_current_source=0
for source in $sources; do
    if [ $source == $current_source ]; then
        break
    fi
    i_current_source=$((i_current_source+1))
done

i_next_source=$((i_current_source+1))
n_sources=$(echo $sources | wc -w)
if [ $i_next_source -gt $((n_sources-1)) ]; then
    i_next_source=0
fi
i_current_source=0
for source in $sources; do
    if [ $i_next_source -eq $i_current_source ]; then
        notify-send "Source: $source" -t 1 -r 1
        pactl set-default-source $source
    fi
    i_current_source=$((i_current_source+1))
done
