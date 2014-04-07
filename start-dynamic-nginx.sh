#!/bin/bash


export PATH=$PATH:/usr/local/bin

# Get everything running

SITES="`etcdget sites-enabled/ | jq -r '.node.nodes[].value'`"

for SITE in $SITES
do
  update-site $SITE > $OUTPUT
done

# Keep listening
watch-sites &
WATCHER=$$
trap "kill -9 $WATCHER" TERM EXIT KILL

exec nginx > $OUTPUT 2> $OUTPUT
