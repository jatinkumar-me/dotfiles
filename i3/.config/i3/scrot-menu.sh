#!/bin/bash

# options to be displayed
option0="󰹑  screen"
option1="  area"
option2="  window"
option3="ocr clipboard"

# options to be displyed
options="$option0\n$option1\n$option2\n$option3"

selected="$(echo -e "$options" | rofi -dmenu -theme-str 'window {width: 20em;} listview {lines: 4;}' -p "scrot")"
case $selected in
    $option0)
        cd ~/Pictures/scrots/ && sleep 1 && scrot --silent;;
    $option1)
        cd ~/Pictures/scrots/ && scrot -s -f --silent;;
    $option2)
        cd ~/Pictures/scrots/ && sleep 1 && scrot -u --silent;;
    $option3)
        cd ~/Pictures/scrots/ && sleep 1 && scrot --silent -s -f -F - | tesseract stdin stdout | xclip -selection clipboard;;
esac
