#!/bin/bash
if [[ $(xdotool search --class kitty | wc -l) -ne 0 ]]
then
    echo "kitty is already running"
    $HOME/.local/bin/kitty @ --to unix:/tmp/kittysocket$(whoami) launch --type=tab $1 $2
    ~/.local/bin/kitty @ --to unix:/tmp/kittysocket$(whoami)  focus-window     
else
    echo "kitty is not running"
    rm /tmp/kittysocket$(whomai)
    $HOME/.local/bin/kitty -o allow-remote-control=yes --listen-on unix:/tmp/kittysocket$(whoami) $1 $2
fi
