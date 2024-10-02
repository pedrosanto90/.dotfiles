#!/bin/bash

# Start scanning for devices
bluetoothctl scan on &

# Wait a few seconds to gather device information
# sleep 1

# Stop scanning
# bluetoothctl scan off

# List available devices with their names
devices=$(bluetoothctl devices | awk '{$1=$2=""; print $0}')

if [ -z "$devices" ]; then
    notify-send "Bluetooth" "No devices found"
    exit 1
fi

# Use wofi to select a device by name
selected_device=$(echo "$devices" | wofi --dmenu --prompt "Select Bluetooth device")

if [ -z "$selected_device" ]; then
    exit 1
fi

# Find the MAC address corresponding to the selected device name
device_mac=$(bluetoothctl devices | grep "$selected_device" | awk '{print $2}')

if [ -z "$device_mac" ]; then
    notify-send "Bluetooth" "Device not found"
    exit 1
fi

# Connect to the selected device
bluetoothctl connect "$device_mac"

