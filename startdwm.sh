#!/bin/sh

feh --bg-scale ~/Downloads/6701000.jpg
setxkbmap us,ru -option 'grp:alt_caps_toggle'
dwmblocks &

while true; do
	# Log stderror to a file
	dwm 2>~/.dwm.log
	# No error logging
	#dwm >/dev/null 2>&1
done
