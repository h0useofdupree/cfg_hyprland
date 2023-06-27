#!/usr/bin/env sh
HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==2{print $2}')
if [ "$HYPRGAMEMODE" = 1 ] ; then
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:drop_shadow 0;\
        keyword decoration:blur 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 1;\
        keyword decoration:rounding 0"
    
    swww img ~/Pictures/walls/DS/tan.jpg -o DP-6
    notify-send 'Gamemode' 'Turning off secondary monitor'
    sleep 2
    hyprctl keyword monitor 'DP-4, disable'
    notify-send "Gamemode" "Gamemode turned on"
    exit
fi
notify-send 'Gamemode' 'Turning on secondary monitor'
sleep 2
hyprctl reload
# hyprctl keyword monitor 'DP-4, 1680x1050@59, 1920x0, 1'
notify-send "Gamemode" "Gamemode turned off"
fish -c 'pw'
