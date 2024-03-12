
#!/bin/bash

TOGGLE_FILE=$HOME/.scripts/focus_mode/focus_mode_active

if [ ! -e $TOGGLE_FILE ]; then
	touch $TOGGLE_FILE
    sed -i "s/(decorate)/(undecorate)/" $HOME/.devilspie/undec.ds
    xfce4-panel -q
    xfconf-query -c xfce4-notifyd -p /do-not-disturb --create -t bool --set true
else
	rm $TOGGLE_FILE
    sed -i "s/(undecorate)/(decorate)/" $HOME/.devilspie/undec.ds
    xfce4-panel &
    xfconf-query -c xfce4-notifyd -p /do-not-disturb --create -t bool --set false
fi	
killall devilspie
devilspie &
