#!/bin/bash










# Get available RAM in MB from /proc/meminfo
#if we use it in VS code
free_ram=$(grep MemAvailable /proc/meminfo | awk '{print $2}')  # in kB, so divide by 1024 for MB
free_ram=$((free_ram / 1024))  # Convert to MB

TH=500

if [[ $free_ram -lt $TH ]]; then
    echo "Warning: RAM is low!"
else 
    echo "The RAM is sufficient: $free_ram MB"
fi
sleep -5s
