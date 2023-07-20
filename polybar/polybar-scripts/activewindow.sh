#!/usr/bin/sh

get_window() {
  xdotool windowactivate "$(xdotool getactivewindow)" >> /dev/null ;
}

kill_task() {
  kill "$(xdotool getwindowfocus getwindowpid)" >> /dev/null ;
}

case "$1" in
    --get)
        get_window
        ;;
    --kill)
        kill_task
        ;;
    *)
        xdotool getwindowfocus getwindowname | head -c48 ;
        ;;
esac
