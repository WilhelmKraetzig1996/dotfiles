#!/bin/bash

if xrandr | grep DisplayPort-0 | grep "disconnected"; then
    currently_connected=false
else
    currently_connected=true
fi

while true
do
    sleep 2
    previously_connected=$currently_connected
    if xrandr | grep DisplayPort-0 | grep "disconnected"; then
        currently_connected=false
    else
        currently_connected=true
    fi
    if [ "$previously_connected" != "$currently_connected" ]; then
        pid=`pidof conky`
        kill $pid
        conky
    fi
done
