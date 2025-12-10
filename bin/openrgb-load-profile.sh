#!/bin/bash
# OpenRGB profile loader script
# Loads the default profile from ~/.config/OpenRGB/default.orp if it exists

PROFILE_FILE="$HOME/.config/OpenRGB/default.orp"

# Check if profile file exists
if [ ! -f "$PROFILE_FILE" ]; then
    exit 0
fi

# Load the profile and check for success message
output=$(openrgb --profile "$PROFILE_FILE" 2>&1)
success=$(echo "$output" | grep -i 'Profile loaded successfully')

if [ -z "$success" ]; then
    # Success message not found, consider execution failed
    exit 1
fi

exit 0

