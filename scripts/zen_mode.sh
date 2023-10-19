#!/usr/bin/env sh
ZENMODE=$(hyprctl getoption general:gaps_in | awk 'NR==2{print $2}')

if [ "$ZENMODE" = 5 ] ; then
  notify-send 'ZEN Mode' 'Removing restrictions and distractions'
  
  if pidof waybar &>/dev/null; then
    killall waybar
  fi
  waybar -s ~/.config/waybar/style_zen.css &
  
  hyprctl --batch "\
    keyword general:gaps_in 0;\
    keyword general:gaps_out 0;\
    keyword decoration:rounding 0;\
    keyword general:col.active_border rgba(FFFFFFAA)"

  notify-send 'ZEN Mode' 'Activated'
  exit
fi

notify-send 'ZEN Mode' 'Returning to default mode'
hyprctl reload
notify-send 'ZEN Mode' 'Deactivated'
