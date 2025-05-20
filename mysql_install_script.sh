#!/bin/bash

# Check if MySQL is installed
if mysql --version >/dev/null 2>&1; then
    echo "MySQL is already installed."
else
    echo "MySQL is not installed."
    sleep 3s
    echo "######## MySQL is installing #############"
    sudo apt-get update
    sudo apt-get install mysql-server-5.7 -y
    sudo mysql_secure_installation
    echo "MySQL has been installed and secured."
fi




#this is the script run for installtion of MySQL database with bash script

