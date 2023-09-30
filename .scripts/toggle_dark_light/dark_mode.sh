#!/bin/bash

xfconf-query -c xsettings -p /Net/ThemeName -s "Adapta-Purple-Nokto"
xfconf-query -c xsettings -p /Net/IconThemeName -s "Zafiro-Icons-Dark"
kitty +kitten themes --reload-in=all Dracula
