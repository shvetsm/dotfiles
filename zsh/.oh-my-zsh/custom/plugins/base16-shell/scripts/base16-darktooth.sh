#!/bin/sh
# base16-shell (https://github.com/chriskempson/base16-shell)
# Base16 Shell template by Chris Kempson (http://chriskempson.com)
# Darktooth scheme by Jason Milkins (https://github.com/jasonm23)

color00="1D/20/21" # Base 00 - Black
color01="FB/54/3F" # Base 08 - Red
color02="95/C0/85" # Base 0B - Green
color03="FA/C0/3B" # Base 0A - Yellow
color04="0D/66/78" # Base 0D - Blue
color05="8F/46/73" # Base 0E - Magenta
color06="8B/A5/9B" # Base 0C - Cyan
color07="A8/99/84" # Base 05 - White
color08="66/5C/54" # Base 03 - Bright Black
color09=$color01 # Base 08 - Bright Red
color10=$color02 # Base 0B - Bright Green
color11=$color03 # Base 0A - Bright Yellow
color12=$color04 # Base 0D - Bright Blue
color13=$color05 # Base 0E - Bright Magenta
color14=$color06 # Base 0C - Bright Cyan
color15="FD/F4/C1" # Base 07 - Bright White
color16="FE/86/25" # Base 09
color17="A8/73/22" # Base 0F
color18="32/30/2F" # Base 01
color19="50/49/45" # Base 02
color20="92/83/74" # Base 04
color21="D5/C4/A1" # Base 06
color_foreground="A8/99/84" # Base 05
color_background="1D/20/21" # Base 00

if [ -n "$TMUX" ]; then
  # Tell tmux to pass the escape sequences through
  # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
  function put_template { printf '\033Ptmux;\033\033]4;%d;rgb:%s\033\033\\\033\\' $@; }
  function put_template_var { printf '\033Ptmux;\033\033]%d;rgb:%s\033\033\\\033\\' $@; }
  function put_template_custom { printf '\033Ptmux;\033\033]%s%s\033\033\\\033\\' $@; }
elif [ "${TERM%%-*}" = "screen" ]; then
  # GNU screen (screen, screen-256color, screen-256color-bce)
  function put_template { printf '\033P\033]4;%d;rgb:%s\033\\' $@; }
  function put_template_var { printf '\033P\033]%d;rgb:%s\033\\' $@; }
  function put_template_custom { printf '\033P\033]%s%s\033\\' $@; }
elif [ "${TERM%%-*}" = "linux" ]; then
  function put_template { [ $1 -lt 16 ] && printf "\e]P%x%s" $1 $(echo $2 | sed 's/\///g'); }
  function put_template_var { true; }
  function put_template_custom { true; }
else
  function put_template { printf '\033]4;%d;rgb:%s\033\\' $@; }
  function put_template_var { printf '\033]%d;rgb:%s\033\\' $@; }
  function put_template_custom { printf '\033]%s%s\033\\' $@; }
fi

# 16 color space
put_template 0  $color00
put_template 1  $color01
put_template 2  $color02
put_template 3  $color03
put_template 4  $color04
put_template 5  $color05
put_template 6  $color06
put_template 7  $color07
put_template 8  $color08
put_template 9  $color09
put_template 10 $color10
put_template 11 $color11
put_template 12 $color12
put_template 13 $color13
put_template 14 $color14
put_template 15 $color15

# 256 color space
put_template 16 $color16
put_template 17 $color17
put_template 18 $color18
put_template 19 $color19
put_template 20 $color20
put_template 21 $color21

# foreground / background / cursor color
if [ -n "$ITERM_SESSION_ID" ]; then
  # iTerm2 proprietary escape codes
  put_template_custom Pg A89984 # foreground
  put_template_custom Ph 1D2021 # background
  put_template_custom Pi A89984 # bold color
  put_template_custom Pj 504945 # selection color
  put_template_custom Pk A89984 # selected text color
  put_template_custom Pl A89984 # cursor
  put_template_custom Pm 1D2021 # cursor text
else
  put_template_var 10 $color_foreground
  if [ "$BASE16_SHELL_SET_BACKGROUND" != false ]; then
    put_template_var 11 $color_background
    if [ "${TERM%%-*}" = "rxvt" ]; then
      put_template_var 708 $color_background # internal border (rxvt)
    fi
  fi
  put_template_custom 12 ";7" # cursor (reverse video)
fi

# clean up
unset -f put_template
unset -f put_template_var
unset -f put_template_custom
unset color00
unset color01
unset color02
unset color03
unset color04
unset color05
unset color06
unset color07
unset color08
unset color09
unset color10
unset color11
unset color12
unset color13
unset color14
unset color15
unset color16
unset color17
unset color18
unset color19
unset color20
unset color21
unset color_foreground
unset color_background