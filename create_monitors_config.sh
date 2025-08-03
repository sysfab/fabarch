#!/bin/bash

OUTPUT_FILE="$HOME/.config/fabarch/hyprland/monitors.conf"

MONITORS_JSON=$(hyprctl monitors -j)

echo "$MONITORS_JSON" | jq -r '.[] | "monitor=\(.name),\(.width)x\(.height)@\(.refreshRate | floor),\(.x)x\(.y),\(.scale)"' >> "$OUTPUT_FILE"