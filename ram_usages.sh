#!/bin/bash


#using RAM in Linux machine OS
Ramfre=$(free -mt | grep 'total' | awk '{print $4}')
TH=500

if (( Ramfre <= TH )); then
    echo "You Ram is low"
else
    echo "Your RAM is good"
fi 

sleep 5


# Get available RAM in MB from /proc/meminfo
#if we use it in VS code
freeRam=$(grep MemAvailable /proc/meminfo | awk '{print $2}')  # in kB, so divide by 1024 for MB
freeRam=$((freeRam / 1024))  # Convert to MB

TH=500

if [[ $freeRam -lt $TH ]]; then
    echo "Warning: RAM is low!"
else 
    echo "The RAM is sufficient: $freeRam MB"
fi

sleep 5


