#!/bin/bash

xfconf-query -c xsettings -p /Net/ThemeName -s "Adapta-Purple-Nokto"
xfconf-query -c xsettings -p /Net/IconThemeName -s "Zafiro-Icons-Dark"
kitty +kitten themes --reload-in=none Dracula
killall -USR1 kitty
sed -i -e "s/simple/darker/g" $HOME/.config/qt5ct/qt5ct.conf 
killall -WINCH nvim
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
