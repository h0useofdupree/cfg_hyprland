#!/usr/bin/env bash


if pidof swww-daemon &>/dev/null ;then
  swww kill
fi

swww init
