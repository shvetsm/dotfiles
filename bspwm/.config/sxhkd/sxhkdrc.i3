#
# Defines keymap for sxhkd
#


#switch to workspace
super + {0-9}
  i3-msg workspace {0-9}

#move focused container to workspace
super + shift + {0-9}
  WP={0-9} && i3-msg move container to workspace $WP && i3-msg workspace $WP
super {_,shift} + m
  i3-msg move {workspace,container} to output left

# Focus
super + {Up,k}
  i3-msg focus up || i3-msg focus output up
super + {Down,j}
  i3-msg focus down || i3-msg focus output down
super + {Left,h}
  i3-msg focus left || i3-msg focus output left
super + {Right,l}
  i3-msg focus right || i3-msg focus output right

# Swap
super + shift + {Up,k}
  i3-msg move up
super + shift + {Down,j}
  i3-msg move down
super + shift + {Left,h}
  i3-msg move left
super + shift + {Right,l}
  i3-msg move right

# Set splitting area
super + {v,h}
  i3-msg split{v,h}

# Set layout
super + {s,z,e}
  i3-msg layout {stacking,tabbed,toggle split}

# Cycle non-empty between workspaces and outputs
super + {_,ctrl + }bracket{left,right}
  i3-msg {workspace,output} {prev,next}_on_output

# Cycle between all workspaces and outputs
super + shift + {_,ctrl + }bracket{left,right}
  i3-msg {workspace,output} {prev,next}

# Toggle fullscreen/floating state
super + f
  i3-msg fullscreen
super + shift + f
  i3-msg floating toggle

# Close/kill current window
super + shift + q
  i3-msg kill window

# Move workspace
super + y
  i3-msg move workspace to output up

# Cycle between windows
super + {_,shift + }n
  i3-msg focus{up,down}

# change focus between tiling / floating windows
super + g
  focus mode_toggle

# focus the parent container
super + a
  focus parent

# Reload configuration
super + shift + r
  $LOCAL_ETC/dunst/reload ; \
    sleep 0.1 ; \
  $LOCAL_ETC/sxhkd/reload ;  \
  $LOCAL_ETC/i3/reload && \
    notify-send -u low "i3 reloaded successfully" || \
    notify-send -u low "failed to reload i3"; \
  $LOCAL_ETC/compton/reload && \
    notify-send -u low "compton reloaded successfully" || \
    notify-send -u low "failed to reload compton"; \
  bash -c 'sleep 3 && xdotool click 1' &

# Quit
super + shift + e
  i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' \
  -b 'Yes, exit i3' 'i3-msg exit'
&

