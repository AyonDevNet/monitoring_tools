#Create a Hard disk Monitoring tools

disk_Space=$(df -H | egrep -v "Filesystem|temps" | grep "sda2" | awk '{print $4}' | tr -d %)

if (( disk_Space == 80 )); then
     echo "this disk is good"
else
    echo "Disk usage is exactly 80% - Warning level reached"
fi


#lets break down this code
#df -H , this option is for excuted the file area
#egreap area actually cancel and deleted the file area
#grep sda2 is actullay is main disk and it is shown by grep comand 
# awk '{print $4}'This part tells awk to print the 4th column of each line of input.
#tr -d % This part is used to delete the percentage symbol (%) from the string.