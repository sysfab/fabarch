#!/bin/bash

WALLPAPER_PATH="$HOME/.config/fabarch/hyprpaper/wallpapers/wallpaper1.jpg"
CONFIG_FILE="$HOME/.config/fabarch/hyprpaper/config.conf"

MONITORS=$(hyprctl monitors | grep -oP 'Monitor \K[^ ]+' | awk '{print}')

CONFIG_CONTENT="preload = $WALLPAPER_PATH
splash = false
"

for MONITOR in $MONITORS; do
    CONFIG_CONTENT+="wallpaper = $MONITOR,$WALLPAPER_PATH
"
done