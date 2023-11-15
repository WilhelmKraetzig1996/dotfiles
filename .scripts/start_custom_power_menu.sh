#!/bin/bash

if [ "$(xdotool getwindowfocus getwindowname)" = "Desktop" ]; then
    $HOME/.config/rofi/scripts/powermenu_t3
elif [[ "$(xdotool getwindowfocus getwindowname)" == *"Slack"* ]]; then
    xdotool getwindowfocus windowminimize
else
    xdotool getwindowfocus windowclose
fi
