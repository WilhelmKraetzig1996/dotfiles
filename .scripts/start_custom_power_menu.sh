#!/bin/bash

if [ "$(xdotool getwindowfocus getwindowname)" = "Desktop" ]; then
    $HOME/.config/rofi/scripts/powermenu_t3
elif [[ $(xprop -id $(xdotool getactivewindow)| grep WM_CLASS | grep kitty | wc -l) -ne 0 ]]; then
    rm /tmp/kittysocket
    xdotool getwindowfocus windowclose
elif [[ "$(xdotool getwindowfocus getwindowname)" == *"Slack"* ]] || [[ "$(xdotool getwindowfocus getwindowname)" == *"A PipeWire Graph Qt GUI Interface"* ]]; then
    xdotool keyup q
    xdotool key --clearmodifiers ctrl+w
else
    xdotool getwindowfocus windowclose
fi
