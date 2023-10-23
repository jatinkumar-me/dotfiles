#!/bin/bash

# Define the name of the internal keyboard
keyboard_name="AT Translated Set 2 keyboard"

# Check the "Device Enabled" property of the keyboard
enabled=$(xinput list-props "$keyboard_name" | grep "Device Enabled" | awk '{print $NF}')

if [ "$enabled" -ne 1 ]; then
    xinput enable "$keyboard_name"
    echo "Internal keyboard '$keyboard_name' is enabled."
    notify-send "Keyboard '$keyboard_name' is enabled."
else
    xinput disable "$keyboard_name"
    echo "Internal keyboard '$keyboard_name' is disabled."
    notify-send "Keyboard '$keyboard_name' is disabled."
fi
