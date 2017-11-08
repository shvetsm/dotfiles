#!/bin/bash
source ~/.config/polybar/config_bar
energy() {
    local ac=/sys/class/power_supply/AC/online
    local bat=/sys/class/power_supply/BAT0/present
    local icon=""
    local batCap=""
    if [[ -e $bat ]] && [[ $(cat $ac) -lt 1 ]]; then
        batCap="$(cat ${bat%/*}/capacity)"
        [ $batCap -gt 90 ] && icon=$BAT100
        [ $batCap -gt 70 ] && [ $batCap -lt 90 ] && icon=$BAT70
        [ $batCap -gt 50 ] && [ $batCap -lt 70 ] && icon=$BAT50
        [ $batCap -gt 30 ] && [ $batCap -lt 50 ] && icon=$BAT30
        [ $batCap -gt 15 ] && [ $batCap -lt 30 ] && icon=$BAT15
        [ $batCap -lt 7 ] && icon=$BAT7
    elif [[ -n $(cat $ac) ]]; then
        batCap="AC"
        icon=$CAC
    else
        batCap="wttf"
    fi
    echo "$(pIcon ${MAGENTA} $icon) $(pText ${WHITE} ${batCap})"
}
echo $(energy)
