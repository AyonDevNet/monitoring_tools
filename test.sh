read -p "Enter your server IP: " SERVER

# Define the list of ports
PORTS=(22 80 443 21 25 3306 8080)

# Loop through each port
for PORT in "${PORTS[@]}"; do
    nc -zv "$SERVER" "$PORT" &>/dev/null
    if [ $? -eq 0 ]; then
        echo "Port $PORT on $SERVER is UP"
    else
        echo "Port $PORT on $SERVER is DOWN"
    fi
done
