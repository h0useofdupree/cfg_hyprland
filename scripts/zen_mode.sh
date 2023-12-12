#!/usr/bin/env sh
# Copyright (c) 2023 Joel Riekemann. All Rights Reserved.


VARPATH="~/.config/hypr/var/zenmode"
ZENMODE=$(cat $VARPATH)

if [ $ZENMODE = "0" ] ; then
  echo "1" > $VARPATH
  
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
echo "0" > $VARPATH
~/.config/hypr/scripts/restart_waybar.sh &
hyprctl reload
notify-send 'ZEN Mode' 'Deactivated'
