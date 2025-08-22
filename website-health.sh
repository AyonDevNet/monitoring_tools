
#this is only for webmonitoring with multipale issue
#multipale responstime

SERVICE_URL="https://cloudly.com.bd/"
RESPONSE_WEBSITE=$(curl -s -o /dev/null -w "%{http_code}" $"RESPONSE_WEBSITE")

if [ $RESPONSE_WEBSITE="200" ]; then
    echo "working"
elif [ $RESPONSE_WEBSITE="301" ]; then
     echo "Redirected"

elif [ $RESPONSE_WEBSITE="404" ]; then
     echo "Not Found"
elif [ $RESPONSE_WEBSITE="500" ]; then
     echo "Server Error"
else
    echo "Other Response: $RESPONSE_WEBSITE"

fi




