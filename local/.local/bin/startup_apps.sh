xautolock -time 1 -locker '$LOCAL_BIN/lockscreen' &
pulseaudio &
sleep 10 && wavebox &
sleep 10 && slack &
sleep 10 && telegram-desktop &
sleep 10 && evolution &
sleep 10  && enpass &
sleep 10 && clipit &
sleep 10 && ckb -b &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
nm-applet &

