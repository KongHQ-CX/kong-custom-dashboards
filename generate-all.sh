#!/bin/bash

ALL_NAMESPACES=(kong-dev kong-stage kong-prod all)

for n in ${ALL_NAMESPACES[@]}; do
    echo ""
    echo "! GENERATING FOR: $n"
    ./customise.sh $n kong-dashboard-$n.json
done
