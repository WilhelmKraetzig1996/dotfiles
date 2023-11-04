#!/bin/bash

if [ "$(xdotool getwindowfocus getwindowname)" = "Desktop" ]; then
    $HOME/.config/rofi/scripts/powermenu_t3
else
    xdotool getwindowfocus windowclose
fi
