//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"┇ ",      "if pactl get-sink-mute alsa_output.pci-0000_00_1f.3.analog-stereo | grep \"Mute:\" | awk '{print $2}' | grep -q \"yes\"; then echo \"\"; else echo \" $(pactl get-sink-volume alsa_output.pci-0000_00_1f.3.analog-stereo | awk '{print $5}')\"; fi",     0,  10},
	{"⌨️ ",  "sh -c 'if [[ \"$(xkblayout-state print %s)\" == \"us\" ]]; then echo \"EN\"; else echo \"RU\"; fi'", 1,   0},
	{" ", "curl -s 'wttr.in/Perm?format=%t'", 300,                         0},
	{" ",   "date '+%d.%m'",                    60,                          0},
	{" ",   "date '+%H:%M '",                   5,                           0},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = "  ┇  ";
static unsigned int delimLen = 7;
