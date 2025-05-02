#!/bin/bash
pactl set-sink-volume alsa_output.pci-0000_00_1f.3.analog-stereo +2% && pkill -RTMIN+10 dwmblocks
