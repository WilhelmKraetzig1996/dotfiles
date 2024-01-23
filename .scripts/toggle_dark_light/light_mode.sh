#!/bin/bash

xfconf-query -c xsettings -p /Net/ThemeName -s "Flat-Remix-GTK-Blue"
xfconf-query -c xfwm4 -p /general/theme -s "Flat-Remix-Light-XFWM"
xfconf-query -c xsettings -p /Net/IconThemeName -s "Flat-Remix-Blue-Light-darkPanel"
kitty +kitten themes --reload-in=none Adwaita light
cp /etc/lightdm/lightdm-gtk-greeter_light.conf /etc/lightdm/lightdm-gtk-greeter.conf
cp $HOME/.config/rofi/powermenu/type-3/shared/light.rasi $HOME/.config/rofi/powermenu/type-3/shared/current.rasi 
cp $HOME/.config/rofi/launchers/type-5/style-4_light.rasi $HOME/.config/rofi/launchers/type-5/style-4.rasi
killall -USR1 kitty
sed -i -e "s/darker/simple/g" $HOME/.config/qt5ct/qt5ct.conf 
killall -WINCH nvim
gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
