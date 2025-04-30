#!/bin/bash
if ping -c 1 8.8.8.8 > /dev/null 2>&1; then
    echo "✅ Network is up"
else
    echo "❌ Network is down"
fi
