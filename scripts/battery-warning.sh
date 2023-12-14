#!/bin/bash

battery_stat="$(acpi --battery)"
battery_greped_status="$(echo $battery_stat | grep -Pio 'remaining|charged')"
battery_percentage_v="$(echo $battery_stat | grep -Po '(\d+%)' | grep -Po '\d+')"

if [ "$battery_greped_status" == "remaining" ] && [ "$battery_percentage_v" -lt 15 ]; then
    runtime="$(echo $battery_stat | grep -Po '[0-9]+:[0-9]+:[0-9]+')"
    dunstify -a system -i "/usr/share/icons/Arc/panel/16/battery-caution.svg" -t 0 -r 9990 -u critical "Battery Critically Low" "${battery_percentage_v}% Remaining.\nRuntime: $runtime"
fi
