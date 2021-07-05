#!/bin/bash 

now=0
while true;
trap 'exit 0' SIGINT
do
    prew=$(grep -c automation,error /scripts/temp.log)
        while [ "$prew" -gt "$now" ]
        do  echo $prew > /scripts/quantityLog.txt
        now=$[$prew]
        done

done
