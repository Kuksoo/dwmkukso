#!/bin/bash
pactl set-sink-mute 0 toggle && pkill -RTMIN+10 dwmblocks
