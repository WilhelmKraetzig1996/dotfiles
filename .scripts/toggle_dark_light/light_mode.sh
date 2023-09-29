#!/bin/bash

xfconf-query -c xsettings -p /Net/ThemeName -s "Adapta-Purple"
kitty +kitten themes --reload-in=all Adwaita light
