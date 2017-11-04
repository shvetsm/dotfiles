$LOCAL_ETC/compton/reload && \
    notify-send -u low "compton reloaded successfully" || \
    notify-send -u low "failed to reload compton"; \
$LOCAL_ETC/dunst/reload ; \
    sleep 0.1 ; \

nitrogen --restore
xrdb ~/.Xresources
~/.config/polybar/reload
~/.config/termite/reload

sleep 0.5
notify-send "Config loaded" "i3/dracula.yaml"