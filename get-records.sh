#!/bin/bash

source .conf

# Get list of DNS record ids in a zone
curl -s GET "https://api.cloudflare.com/client/v4/zones/$ZONEID/dns_records" \
-H "X-Auth-Email: $CFUSER" \
-H "X-Auth-Key: $CFKEY" \
-H "Content-Type: application/json" \
| jq '.result[] | {name, id, zone_id, zone_name, content, type}'

./clear-conf.sh