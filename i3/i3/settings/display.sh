#!/bin/bash

if xrandr | grep -q "^HDMI-A-0 connected"; then
    echo "HDMI connected: using dual monitor config"
    cp ~/.config/i3/settings/display_dual ~/.config/i3/config
else
    echo "HDMI not connected: using single monitor config"
    cp ~/.config/i3/settings/display_single ~/.config/i3/config
fi

# Reload i3 config and restart (apply changes)
i3-msg reload
i3-msg restart
