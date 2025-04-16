#!/bin/bash
pactl set-sink-volume 0 +2% && pkill -RTMIN+10 dwmblocks
