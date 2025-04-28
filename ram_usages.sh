#this is command help you to identified ram usages in Linux OS

free_ram=$(free -mt | grep "total" | awk '{print $4}')
TH=500

if [[ free_ram -lt TH ]]; then
     echo "Warning the RAM is low"
else 
     echo "The is RAM is suficient" $free_ram
fi