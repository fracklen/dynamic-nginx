#!/bin/bash


export PATH=$PATH:/usr/local/bin

# Get everything running

SITES="`etcdget sites-enabled/ | jq -r '.node.nodes[].value' | grep -v null `"

for SITE in $SITES
do
  echo "Initalizing site $SITE..." >> $OUTPUT
  update-site $SITE 2>&1 >> $OUTPUT
done

# Keep listening
watch-sites
