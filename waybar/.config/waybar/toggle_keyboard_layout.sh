#!/bin/bash

# Define your layouts
LAYOUT1="us"
LAYOUT2="br"

# Get the current layout
CURRENT_LAYOUT=$(swaymsg -t get_inputs | grep -m1 'xkb_active_layout_name' | cut -d '"' -f4)
echo "Current layout: $CURRENT_LAYOUT"

# Toggle between layouts
if [ "$CURRENT_LAYOUT" == "English (US)" ]; then
  swaymsg input "*" xkb_layout "$LAYOUT2"
  echo "Switching to $LAYOUT2"
else
  swaymsg input "*" xkb_layout "$LAYOUT1"
  echo "Switching to $LAYOUT1"
fi

# Send the signal to Waybar to update the displayed layout
pkill -RTMIN+1 waybar
