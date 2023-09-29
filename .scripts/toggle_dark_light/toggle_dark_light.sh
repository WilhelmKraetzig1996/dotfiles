#!/bin/bash

TOGGLE_FILE=$HOME/.scripts/toggle_dark_light/dark_mode_active

if [ ! -e $TOGGLE_FILE ]; then
	touch $TOGGLE_FILE
	$HOME/.scripts/toggle_dark_light/dark_mode.sh
else
	rm $TOGGLE_FILE
	$HOME/.scripts/toggle_dark_light/light_mode.sh
fi	
