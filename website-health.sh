
#this is only for webmonitoring with multipale issue
#multipale responstime

SERVICE_URL="https://cloudly.com.bd/"
RESPONSE_WEBSITE=$(curl -s -o /dev/null -w "%{http_code}" $"RESPONSE_WEBSITE")

if [ $RESPONSE_WEBSITE="200" ]; then
    echo "working"
elif [ "$RESPONSE_WEBSITE" = "301" ] || [ "$RESPONSE_WEBSITE" = "302" ]; then
     echo "Redirected"

elif [ $RESPONSE_WEBSITE="404" ]; then
     echo "Not Found"
elif [ $RESPONSE_WEBSITE="500" ]; then
     echo "Server Error"
else
    echo "Other Response: $RESPONSE_WEBSITE"

fi




#Create a script that checks one site every 1 minute using while true; do ... sleep 60; done.


SITE="https://cloudly.com.bd/"

while true; do
  STATUS_CODE="(curl -s -o /dev/net -w "%{http_code}" $SITE)"

if [ "$STATUS_CODE" == "200" ]; then
     echo " ${date}: the site is up"
else
          echo " ${date}: the site is down (Status: $STATUS_CODE)"

fi
      sleep 10; 
   
done



#if server is down then it will sent the email to Adminitrator that server is down


#!/bin/bash

SITE="https://cloudly.com.bd/"
SUBJECT="Web server is down"
TO="mohammedayon2021@gmail.com"

# Track server status
SERVER_STATUS=true

while true; do
    SITE_CURL=$(curl -s -o /dev/null -w "%{http_code}" "$SITE")

    if [ "$SITE_CURL" = "200" ]; then
        echo "$(date): The website is working"
        SERVER_STATUS=true   # reset flag when server is up
        
    else
        echo "$(date): Server is NOT working (status: $SITE_CURL)"

        # Only send email if server was previously UP
        if [ "$SERVER_STATUS" = true ]; then
            echo "Alert: $SITE is down! Status code: $SITE_CURL" 
| mail -s "$SUBJECT" "$TO"

            SERVER_STATUS=false
        fi
    fi

    sleep 60
done
 