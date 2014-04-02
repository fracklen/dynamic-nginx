#!/bin/bash

nginx > $OUTPUT &

export PATH=$PATH:/usr/local/bin

# Get everything running

SITES="`etcdget sites-enabled/ | jq -r '.node.nodes[].value'`"

for SITE in $SITES
do
  update-site $SITE > $OUTPUT
done

# Keep listening

while true
do
  update-nginx > $OUTPUT
done
