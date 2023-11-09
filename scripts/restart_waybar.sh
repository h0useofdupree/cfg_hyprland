#!/usr/bin/env bash
# Copyright (c) 2023 Joel Riekemann. All Rights Reserved.


if pidof waybar &>/dev/null; then
  killall waybar
fi
waybar -s $WAYBAR_STYLE &
