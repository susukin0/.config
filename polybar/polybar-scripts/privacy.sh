#!/usr/bin/env bash

MODULES=("snd_usb_audio" "uvcvideo" "gspca_main")

is_module_loaded() {
    lsmod | grep -q "^${1//-/_}\b"
}

print_status() {
    microphone_status=$(pactl get-source-mute @DEFAULT_SOURCE@ | grep "Mute: no")

    for module in "${MODULES[@]}"; do
        if is_module_loaded "$module" || [[ -n "$microphone_status" ]]; then
            echo -e "\uf06e"
            return  # Exit the loop after finding the first active module or unmuted microphone
        else
            echo -e "\uf070"
        fi
    done
}

toggle_modules() {
    microphone_status=$(pactl get-source-mute @DEFAULT_SOURCE@ | grep "Mute: no")

    for module in "${MODULES[@]}"; do
        if is_module_loaded "$module"; then
            doas rmmod -f "$module" >/dev/null
        else
            doas modprobe -f "$module" >/dev/null
        fi
    done

    # Toggle microphone mute/unmute
    if [[ -n "$microphone_status" ]]; then
        pactl set-source-mute @DEFAULT_SOURCE@ 1 >/dev/null
    else
        pactl set-source-mute @DEFAULT_SOURCE@ 0 >/dev/null
    fi
}

case "$1" in
    --toggle)
        toggle_modules
        ;;
    *)
        print_status
        ;;
esac
