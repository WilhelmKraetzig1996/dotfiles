#!/bin/bash

xfconf-query -c xsettings -p /Net/ThemeName -s "Flat-Remix-GTK-Blue-Darkest"
xfconf-query -c xfwm4 -p /general/theme -s "Flat-Remix-Darkest-XFWM"
xfconf-query -c xsettings -p /Net/IconThemeName -s "Flat-Remix-Blue-Dark"
cp $HOME/.config/kitty/dark-theme.conf $HOME/.config/kitty/current-theme.conf
cp /etc/lightdm/lightdm-gtk-greeter_dark.conf /etc/lightdm/lightdm-gtk-greeter.conf
cp $HOME/.config/rofi/powermenu/type-3/shared/dark.rasi $HOME/.config/rofi/powermenu/type-3/shared/current.rasi
cp $HOME/.config/rofi/launchers/type-5/style-4_dark.rasi $HOME/.config/rofi/launchers/type-5/style-4.rasi
killall -USR1 kitty
sed -i -e "s/simple/darker/g" $HOME/.config/qt5ct/qt5ct.conf 
killall -WINCH nvim
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
