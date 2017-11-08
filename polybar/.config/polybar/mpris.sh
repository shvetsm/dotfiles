#!/bin/bash
source ~/.config/polybar/config_bar
# Specifying the icon(s) in the script
# This allows us to change its appearance conditionally
icon=$(pIcon ${MAGENTA} ${CSOUND})
stat="$(playerctl status 2>/dev/null)"
artist=$(playerctl metadata artist 2>/dev/null)
musicname=$(playerctl metadata title 2>/dev/null)
cmd=""

if [ "${stat}" ] && [ "${stat}" = "Playing" ] ; then
    _artist=$(pText ${MAGENTA} "${artist:0:10}")
    _music=$(pText ${BLUE2} "${musicname:0:25}")
    cmd=" playing $_artist * $_music"
elif [ "${stat}" ] && [ "${stat}" = "Paused" ] ; then
    _artist=$(pText ${MAGENTA} "${artist:0:10}")
    _music=$(pText ${BLUE2} "${musicname:0:25}")
    cmd=" paused $_artist * $_music"
else
    cmd=" no sound"
fi

echo "${icon}$(pText ${WHITE} "${cmd}")"

