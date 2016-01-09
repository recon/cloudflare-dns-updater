#!/bin/bash

source .conf

# Get list of zone ids
curl -s -X GET "https://api.cloudflare.com/client/v4/zones" \
-H "X-Auth-Email: $CFUSER" \
-H "X-Auth-Key: $CFKEY" \
-H "Content-Type: application/json" \
| jq '.result[] | {name, id}'

./clear-conf.sh