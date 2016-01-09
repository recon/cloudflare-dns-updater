#!/bin/bash

source .conf

curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/$ZONEID/dns_records/$DNSRECID" \
-H "X-Auth-Email: $CFUSER" \
-H "X-Auth-Key: $CFKEY" \
-H "Content-Type: application/json" \
--data '{"id":"'$DNSRECID'","type":"A","name":"'$CFHOST'","content":"'`dig +short myip.opendns.com @resolver1.opendns.com`'"}' \
| jq

./clear-conf.sh