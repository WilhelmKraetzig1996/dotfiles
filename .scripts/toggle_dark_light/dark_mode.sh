#!/bin/bash

xfconf-query -c xsettings -p /Net/ThemeName -s "Adapta-Purple-Nokto"
kitty +kitten themes --reload-in=all Dracula
