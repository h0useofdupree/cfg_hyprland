#!/usr/bin/env sh
CINEMAMODE=$(cat ~/.config/hypr/variables/cinemamode)

if [ "$CINEMAMODE" = 0 ] ; then
    echo 1 > ~/.config/hypr/variables/cinemamode
    notify-send 'Cinemamode' 'Turning off secondary monitor'
    sleep 2
    hyprctl keyword monitor 'DP-4, disable'
    notify-send "Cinemamode" "Cinemamode turned on"
    exit
fi
echo 0 > ~/.config/hypr/variables/cinemamode
notify-send 'Cinemamode' 'Turning on secondary monitor'
sleep 2
hyprctl reload
notify-send "Cinemamode" "Cinemamode turned off"
fish -c 'pwr'
