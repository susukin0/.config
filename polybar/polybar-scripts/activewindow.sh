#!/usr/bin/sh

get_window() {
  xdotool windowactivate "$(xdotool getactivewindow)" ;
}

case "$1" in
    --get)
        get_window
        ;;
    *)
        xdotool getwindowfocus getwindowname ;
        ;;
esac
