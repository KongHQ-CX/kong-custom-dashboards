#!/bin/bash

ALL_NAMESPACE_FAMILIES=(finance tax internal kong-prod all)

for n in ${ALL_NAMESPACE_FAMILIES[@]}; do
    echo ""
    echo "! GENERATING FOR: $n"
    ./customise.sh $n kong-dashboard-$n.json
done
