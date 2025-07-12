#!/bin/bash

# Simple script to mount USB and copy flag file

USB_DEVICE="/dev/sda1"
FLAG_FILE="$HOME/Downloads/flag"

# Check if already mounted, get mount point
if mount | grep -q "$USB_DEVICE"; then
    MOUNT_POINT=$(mount | grep "$USB_DEVICE" | sed 's/^[^ ]* on \(.*\) type .*/\1/')
else
    # Mount USB stick
    MOUNT_OUTPUT=$(udisksctl mount -b "$USB_DEVICE" 2>&1)
    MOUNT_POINT=$(echo "$MOUNT_OUTPUT" | grep -o '/media/[^[:space:]]*' | head -1)
fi

# Copy flag file to USB
cp "$FLAG_FILE" "$MOUNT_POINT/"

echo "Flag copied to USB"