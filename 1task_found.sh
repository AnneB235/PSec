#!/bin/bash

# Script to simulate tracking and "scare" the user

username="$USER"

# Get location
latlon=$(curl -s "https://ipinfo.io/loc" 2>/dev/null || echo "unknown")

# Open location in browser
if [ "$latlon" != "unknown" ]; then
    lat=$(echo "$latlon" | cut -d',' -f1)
    lon=$(echo "$latlon" | cut -d',' -f2)
    xdg-open "https://www.latlong.net/c/?lat=${lat}&long=${lon}" 2>/dev/null &
fi

# Scary messages
spd-say "We found you, $username" &
sleep 2
spd-say "We know where you are" &
sleep 2
spd-say "Expect us" &
