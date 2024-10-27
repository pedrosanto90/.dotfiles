#!/bin/bash

# Function to list all paired Bluetooth devices
list_devices() {
    bluetoothctl devices Paired | awk '{for (i=3; i<=NF; i++) printf "%s ", $i; printf "(%s)\n", $2}'
}

# Display the currently connected Bluetooth devices for i3blocks
CONNECTED_DEVICE=$(bluetoothctl info | grep "Name:" | awk '{for (i=2; i<=NF; i++) printf "%s ", $i}')
if [ -n "$CONNECTED_DEVICE" ]; then
    echo " $CONNECTED_DEVICE"
else
    echo " "
fi

# On left-click, list devices and allow connection selection
if [ "$BLOCK_BUTTON" == "1" ]; then
    # Use rofi or dmenu to select a device
    SELECTED_DEVICE=$(list_devices | rofi -dmenu -p "Select Bluetooth Device" | awk -F '[()]' '{print $2}')
    
    # If a device was selected, connect or disconnect
    if [ -n "$SELECTED_DEVICE" ]; then
        # Check if the selected device is already connected
        if bluetoothctl info "$SELECTED_DEVICE" | grep -q "Connected: yes"; then
            # Disconnect if already connected
            bluetoothctl disconnect "$SELECTED_DEVICE"
            echo "Disconnected from device"
        else
            # Connect if not connected
            bluetoothctl connect "$SELECTED_DEVICE"
            echo "Connecting to device..."
        fi
    fi
fi

    # echo " $CONNECTED_DEVICE"
