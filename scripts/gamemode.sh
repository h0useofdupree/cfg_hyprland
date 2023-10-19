#!/usr/bin/env sh
GAMEMODE=$(cat ~/.config/hypr/variables/gamemode)

if [ "$GAMEMODE" = 0 ] ; then
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:drop_shadow 0;\
        keyword decoration:blur 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 1;\
        keyword decoration:rounding 0"
    
    echo 1 > ~/.config/hypr/variables/gamemode
    
    swww img ~/Pictures/walls/DS/tan.jpg -o DP-6
    notify-send 'Gamemode' 'Deactivating secondary monitor'
    sleep 2
    hyprctl keyword monitor 'DP-4, disable'
    notify-send "Gamemode" "Gamemode activated"
    exit
fi
echo 0 > ~/.config/hypr/variables/gamemode
notify-send 'Gamemode' 'Activating secondary monitor'
sleep 2
hyprctl reload
notify-send "Gamemode" "Gamemode deactivated"
fish -c 'pwr'
