#!/bin/bash

ALL_NAMESPACES=(kong-team1 kong-team2 all)

for n in ${ALL_NAMESPACES[@]}; do
    echo ""
    echo "! GENERATING FOR: $n"
    ./customise.sh $n kong-dashboard-$n.json
done
