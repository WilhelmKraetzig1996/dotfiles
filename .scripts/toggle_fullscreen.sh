#!/bin/bash

WM_CLASS=$(xprop -id $(xdotool getactivewindow) WM_CLASS | awk -F '"' '{print $4}')
WM_NAME=$(xprop -id $(xdotool getactivewindow) WM_NAME | awk -F '"' '{print $2}')
TOGGLE_FILE=$HOME/.scripts/focus_mode/focus_mode_active

if [[ "$WM_CLASS" == "Virt-manager" && "$WM_NAME" != "Virtual Machine Manager" ]]; then
    win_pos_x=$(xdotool getactivewindow getwindowgeometry | grep Position | cut -d " " -f 4 | cut -d "," -f 1)
    win_pos_y=$(xdotool getactivewindow getwindowgeometry | grep Position | cut -d " " -f 4 | cut -d "," -f 2)
    win_width=$(xdotool getactivewindow getwindowgeometry | grep Geometry | cut -d " " -f 4 | cut -d "x" -f 1)

    if [ ! -e $TOGGLE_FILE ]; then
        close_button_pos_x=$((win_pos_x+win_width-15))
        close_button_pos_y=$((win_pos_y+20))
    else
        close_button_pos_x=$((win_pos_x+win_width-15))
        close_button_pos_y=$((win_pos_y+40))
    fi

    prev_mouse_pos_x=$(xdotool getmouselocation | cut -d " " -f 1 | cut -d ":" -f 2)
    prev_mouse_pos_y=$(xdotool getmouselocation | cut -d " " -f 2 | cut -d ":" -f 2)
    xdotool mousemove $close_button_pos_x $close_button_pos_y
    xdotool click --clearmodifiers 1

    close_button_pos_x=$((win_pos_x+win_width/2))
    close_button_pos_y=$((win_pos_y))
    xdotool mousemove $close_button_pos_x $close_button_pos_y
    close_button_pos_x=$((win_pos_x+win_width/2-5))
    close_button_pos_y=$((win_pos_y+10))
    sleep 0.1
    xdotool mousemove $close_button_pos_x $close_button_pos_y
    xdotool click --clearmodifiers 1
    xdotool mousemove $prev_mouse_pos_x $prev_mouse_pos_y

else
    wmctrl -r :ACTIVE: -b toggle,fullscreen
fi
