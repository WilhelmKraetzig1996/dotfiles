#!/bin/bash

TOGGLE_FILE=$HOME/.scripts/toggle_dark_light/dark_mode_active

if [ ! -e $TOGGLE_FILE ]; then
    batcat $1 --theme OneHalfLight
else
    batcat $1 --theme OneHalfDark
fi
