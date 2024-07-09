#!/bin/bash

if [ "$(xdotool getwindowfocus getwindowname)" = "Desktop" ]; then
    $HOME/.config/rofi/scripts/powermenu_t3
elif [[ $(xprop -id $(xdotool getactivewindow)| grep WM_CLASS | grep kitty | wc -l) -ne 0 ]]; then
    rm /tmp/kittysocket
    xdotool getwindowfocus windowclose
elif [[ "$(xdotool getwindowfocus getwindowname)" == *"Slack"* ]] || [[ "$(xdotool getwindowfocus getwindowname)" == *"A PipeWire Graph Qt GUI Interface"* ]]; then
    xdotool keyup q
    xdotool key --clearmodifiers ctrl+w

elif [[ "$(xdotool getwindowfocus getwindowname)" == *"VLC media player"* ]]; then
    killall -s 9 vlc
elif [[ "$(xdotool getwindowfocus getwindowname)" == *"KeePassXC"* ]]; then
    killall keepassxc
elif [[ "$(xdotool getwindowfocus getwindowname)" == *"Microsoft Teams" ]]; then
    xdotool keyup q
    xdotool key --clearmodifiers ctrl+h
else
    xdotool getwindowfocus windowclose
fi
