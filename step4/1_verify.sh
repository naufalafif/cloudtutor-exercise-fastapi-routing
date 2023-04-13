#!/bin/bash

URL="http://localhost:80/challenge/1"

# Send GET request to API endpoint and store JSON response in a variable
JSON=$(curl -s $URL)

# Check if JSON response contains "message" attribute with value "success" and "number" attribute with a number value
if [[ $(echo $JSON | jq '.message') == '"success"' ]] && [[ $(echo $JSON | jq '.number') =~ ^[0-9]+$ ]]; then
    echo "OK"
else
    echo "Belum berjalan sesuai ketentuan challenge"
fi