#!/usr/bin/env sh
# Copyright (c) 2023 Joel Riekemann. All Rights Reserved.

VARPATH="~/.config/hypr/var/gamemode"
GAMEMODE=$(cat ~/.config/hypr/var/gamemode)

if [ $GAMEMODE = "0" ] ; then
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:drop_shadow 0;\
        keyword decoration:blur 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 1;\
        keyword decoration:rounding 0"
    
    echo "1" > ~/.config/hypr/var/gamemode
    
    notify-send 'Gamemode' 'Deactivating secondary monitor'
    sleep 1
    hyprctl keyword monitor 'DP-4, disable'
    notify-send "Gamemode" "Gamemode activated"
    exit
fi
echo "0" > ~/.config/hypr/var/gamemode
notify-send 'Gamemode' 'Activating secondary monitor'
sleep 1
hyprctl reload
notify-send "Gamemode" "Gamemode deactivated"
