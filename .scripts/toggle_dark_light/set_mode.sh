#!/bin/bash

TOGGLE_FILE=$HOME/.scripts/toggle_dark_light/dark_mode_active

if [ ! -e $TOGGLE_FILE ]; then
	gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
else
	gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
fi	
