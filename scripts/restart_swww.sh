#!/usr/bin/env bash
# Copyright (c) 2023 Joel Riekemann. All Rights Reserved.


if pidof swww-daemon &>/dev/null ;then
  swww kill
fi

swww init
