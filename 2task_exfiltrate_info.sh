#!/bin/bash

# Script to get public IP and log to USB stick

USERNAME=$(whoami)
MOUNT_POINT="/media/$USERNAME/$(ls /media/$USERNAME/ | head -1)"

# Get system information
hostname=$(hostname)
username="$USER"
wan_ip=$(curl -s "https://api.ipify.org" 2>/dev/null || echo "Unknown")
local_ip=$(hostname -I | awk '{print $1}' 2>/dev/null || echo "Unknown")
os_info=$(lsb_release -d 2>/dev/null | cut -f2 || uname -s)
kernel=$(uname -r)
uptime_info=$(uptime -p 2>/dev/null || uptime)
wifi_networks=$(nmcli -t -f SSID dev wifi 2>/dev/null | head -5 | tr '\n' ', ' | sed 's/,$//')
running_services=$(systemctl list-units --type=service --state=running --no-pager --no-legend | wc -l)
open_ports=$(ss -tuln 2>/dev/null | grep LISTEN | wc -l)
downloads_tree=$(tree "$HOME/Downloads" 2>/dev/null || find "$HOME/Downloads" -type f 2>/dev/null)

# Log to USB if available
if [ -n "$MOUNT_POINT" ]; then
    log_file="$MOUNT_POINT/recon_log.txt"    
    {
        echo "=== SYSTEM RECONNAISSANCE ==="
        echo "Time: $(date)"
        echo "Hostname: $hostname"
        echo "Username: $username"
        echo "Public IP: $wan_ip"
        echo "Local IP: $local_ip"
        echo "OS: $os_info"
        echo "Kernel: $kernel"
        echo "Uptime: $uptime_info"
        echo "WiFi Networks: $wifi_networks"
        echo "Running Services: $running_services"
        echo "Open Ports: $open_ports"
        echo ""
        echo "=== DOWNLOADS FOLDER ==="
        echo "$downloads_tree"
        echo "============================"
        echo ""
    } >> "$log_file"
fi
