#!/bin/bash
source ~/.config/polybar/config_bar
net() {
    local _GETIWL=$(/sbin/iwgetid -r)
    local _GETETH=$(ip a | grep "state UP" | awk '{ORS=""}{print $2}' | cut -d ':' -f 1)
    local _status=${_GETIWL:-$_GETETH}
    local _status2="${_status:-Down}"
    local icon="$(pIcon ${MAGENTA} ${CNET})"
    local cmd=$(pText ${WHITE} " ${_status2} ")

    echo "${icon}${cmd}"
}

wifi_str() {
    local _icon=$(pIcon ${MAGENTA} ${WIFI_STR})
    local _cmd=$(/sbin/iwconfig 2>/dev/null | grep "Link Quality" | cut -d "=" -f 2 | awk '{print $1}')
    echo "${_icon} ${_cmd}"
}

echo "$(wifi_str) $(net)"
