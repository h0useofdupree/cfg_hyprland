#!/usr/bin/env sh
# Copyright (c) 2023 Joel Riekemann. All Rights Reserved.

CINEMAMODE=$(cat ~/.config/hypr/var/cinemamode)

if [ $CINEMAMODE = "0" ] ; then
    echo "1" > ~/.config/hypr/var/cinemamode
    notify-send 'Cinemamode' 'Turning off secondary monitor'
    sleep 1
    hyprctl keyword monitor 'DP-4, disable'
    notify-send "Cinemamode" "Cinemamode turned on"
    exit
fi
echo "0" > ~/.config/hypr/var/cinemamode
notify-send 'Cinemamode' 'Turning on secondary monitor'
sleep 1
hyprctl reload
notify-send "Cinemamode" "Cinemamode turned off"
