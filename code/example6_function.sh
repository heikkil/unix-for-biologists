#!/bin/bash
# example6_function.sh
function countdown {
    COUNTER=$1
    until [ $COUNTER -lt 1 ]; do
        echo $COUNTER
        let COUNTER-=1
    done
}
countdown 3
exit 0
