#!/bin/bash

if [ "$(xdotool getwindowfocus getwindowname)" = "Desktop" ]; then
    $HOME/.config/rofi/scripts/powermenu_t3
elif [[ "$(xdotool getwindowfocus getwindowname)" == *"Slack"* ]] || [[ "$(xdotool getwindowfocus getwindowname)" == *"A PipeWire Graph Qt GUI Interface"* ]]; then
    win_pos_x=$(xdotool getactivewindow getwindowgeometry | grep Position | cut -d " " -f 4 | cut -d "," -f 1)
    win_pos_y=$(xdotool getactivewindow getwindowgeometry | grep Position | cut -d " " -f 4 | cut -d "," -f 2)
    win_width=$(xdotool getactivewindow getwindowgeometry | grep Geometry | cut -d " " -f 4 | cut -d "x" -f 1)

    close_button_pos_x=$((win_pos_x+win_width-5))
    close_button_pos_y=$((win_pos_y-30))
    prev_mouse_pos_x=$(xdotool getmouselocation | cut -d " " -f 1 | cut -d ":" -f 2)
    prev_mouse_pos_y=$(xdotool getmouselocation | cut -d " " -f 2 | cut -d ":" -f 2)
    xdotool mousemove $close_button_pos_x $close_button_pos_y
    xdotool click --clearmodifiers 1
    xdotool mousemove $prev_mouse_pos_x $prev_mouse_pos_y
else
    xdotool getwindowfocus windowclose
fi
