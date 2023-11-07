#!/usr/bin/env sh
ZENMODE=$(hyprctl getoption general:gaps_in | awk 'NR==2{print $2}')

if [ "$ZENMODE" = 20 ] ; then
  
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

hyprctl reload
notify-send 'ZEN Mode' 'Deactivated'
