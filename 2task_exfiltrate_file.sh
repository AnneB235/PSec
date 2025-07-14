#!/bin/bash

# Simple script to mount USB and copy flag file

USERNAME=$(whoami)
MOUNT_POINT="/media/$USERNAME/$(ls /media/$USERNAME/ | head -1)"
FLAG_FILE="$HOME/Downloads/flag"

# Copy flag file to USB
cp "$FLAG_FILE" "$MOUNT_POINT/"

echo "Flag copied to USB"