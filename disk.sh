#Create a Hard disk Monitoring tools

disk_Space=$(df -H | grep -v "Filesystem|temps" | grep "sda2" | awk '{print $4}' | tr -d %)

if (( disk_Space == 80 )); then
     echo "this disk is good"
else
    echo "You need more disk space"
fi