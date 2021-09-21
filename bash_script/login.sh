#!/bin/bash
# Credentials
USER="admin"
PASSWORD="SuperSecure"
# Router IP
SWITCH_IP="192.168.2.6"
# This is optional in my experiamentations:
AGENT="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36"

CONTENT_TYPE="application/x-www-form-urlencoded"
# The data we are sending to the switch
DATA="username=$USER&password=$PASSWORD&cpassword=&logon=Login"
ACCEPT="text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9"
# (country code) This should not really matter:
CCODE="nl"

LOGN=$(curl -s -XPOST  "http://$SWITCH_IP/logon.cgi" \
  -H "Connection: keep-alive" \
  -H "Content-Length: 56" \
  -H "Cache-Control: max-age=0" \
  -H "Upgrade-Insecure-Requests: 1" \
  -H "Origin: http://$SWITCH_IP" \
  -H "Content-Type: $CONTENT_TYPE" \
  -H "User-Agent: $AGENT" \
  -H "Accept: $ACCEPT" \
  -H "Referer: http://$SWITCH_IP/" \
  -H "Accept-Encoding: gzip, deflate" \
  -H "Accept-Language: en-US,en;q=0.9,$CCODE;q=0.8" \
  -H "DNT: 1" \
  -H "sec-gpc: 1" \
  --data "$DATA" | sed -n '3,3p' | tr -d ",")

if [ $LOGN == "0" ]; then
  echo "Login Succes"
else
  echo "Wrong user name or password"
fi
