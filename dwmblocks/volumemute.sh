#!/bin/bash
wpctl set-mute @DEFAULT_SINK@ toggle && pkill -RTMIN+10 dwmblocks
