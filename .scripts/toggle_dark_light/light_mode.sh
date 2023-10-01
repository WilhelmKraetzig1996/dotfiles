#!/bin/bash

xfconf-query -c xsettings -p /Net/ThemeName -s "Adapta-Purple"
xfconf-query -c xsettings -p /Net/IconThemeName -s "Zafiro-Icons-Light"
kitty +kitten themes --reload-in=all Adwaita light
sed -i -e "s/darker/simple/g" $HOME/.config/qt5ct/qt5ct.conf 
