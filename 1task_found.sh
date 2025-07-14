#!/bin/bash

# Script to simulate tracking and "scare" the user

username="$USER"

# Get location
if command -v wget >/dev/null 2>&1; then
    latlon=$(wget -qO- "https://ipinfo.io/loc" 2>/dev/null)
elif command -v curl >/dev/null 2>&1; then
    latlon=$(curl -s "https://ipinfo.io/loc" 2>/dev/null)
elif command -v python3 >/dev/null 2>&1; then
    latlon=$(python3 -c "import urllib.request; print(urllib.request.urlopen('https://ipinfo.io/loc').read().decode().strip())" 2>/dev/null)
elif command -v python >/dev/null 2>&1; then
    latlon=$(python -c "import urllib2; print urllib2.urlopen('https://ipinfo.io/loc').read().strip()" 2>/dev/null)
else
    latlon="unknown"
fi

# Fallback if all methods fail
[ -z "$latlon" ] && latlon="unknown"

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
