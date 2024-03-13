#!/usr/bin/env sh
# Copyright (c) 2023 Joel Riekemann. All Rights Reserved.


VARPATH="$HOME/.config/hypr/var/zenmode"
ZENMODE=$(cat "$VARPATH")

if [ "$ZENMODE" = "0" ] ; then
  echo "1" > "$VARPATH"
  
  if pidof waybar >/dev/null; then
    killall waybar
  fi
  waybar -s ~/.config/waybar/style_zen.css -c ~/.config/waybar/config_zen &
  
  hyprctl --batch "\
    keyword general:gaps_in 0;\
    keyword general:gaps_out 0;\
    keyword decoration:rounding 0;\
    keyword general:col.active_border rgba(FFFFFFAA)"

  hyprctl notify 1 2500 "rgba(ffffff99)" "Zen Mode activated" &
  exit
fi
echo "0" > "$VARPATH"
fish -c "restartWaybar"
hyprctl reload
hyprctl notify 1 2500 "rgba(ffffff99)" "Zen Mode deactivated" &
