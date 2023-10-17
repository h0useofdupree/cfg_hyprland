#!/usr/bin/env bash

if pidof waybar &>/dev/null; then
  killall waybar
fi
waybar &
