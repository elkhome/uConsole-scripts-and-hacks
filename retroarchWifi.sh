#!/bin/bash

# Check if AC power supply is not present
if [[ $(cat /sys/class/power_supply/axp22x-ac/present) -eq 0 ]]; then
    # Check if RetroArch is running
    if pgrep -x "retroarch" >/dev/null; then
        echo "AC power supply not present. RetroArch is running. Disabling Wi-Fi..."
        nmcli radio wifi off
    else
        echo "AC power supply not present. RetroArch is not running."
    fi
else
    echo "AC power supply is present. Enabling Wi-Fi..."
    nmcli radio wifi on
fi