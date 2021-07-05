#!/bin/bash

var1=$(date +"%F %H:%M:%S")',https://api-prod.distancematrix.ai/maps/api/distancematrix/json?origins=49.990569,36.268016&destinations=49.977206,36.267089&mode=driving&departure_time=1620142450&avoid=ferries&key=><head><title>520 Origin Error</title></head><body bgcolor="white"><center><h1>520 Origin Error</h1></center><hr><center>cloudflare-nginx</center></body></html>,null,automation,error'
var2=$(date +"%F %H:%M:%S")',https://api-prod.distancematrix.ai/maps/api/distancematrix/json?origins=50.038696,36.245325&destinations=50.032585,36.211557&mode=driving&departure_time=now&avoid=ferries&key=Thoo3miyiexefaeThudie7oojooC9,{"destination_addresses":["Dinamyte Gym, 10/, 23-ho Serpnya St, 12, Kharkiv, Kharkiv Oblast, Ukraine"],"origin_addresses":["MedMarket, Balakirjeva St, 8/1, Kharkiv, Kharkiv Oblast, Ukraine, 61039"],"rows":[{"elements":[{"distance":{"text":"3.3 km","value":3268},"duration":{"text":"9 min","value":521},"duration_in_traffic":{"text":"6 mins","value":360},"status":"OK"}]}],"status":"OK"},0.81,manual_routing,success'

while true;
trap 'exit 0' SIGINT
sleep 1;
random=$((1 + RANDOM % 2))
do
if [ "$random" -eq 1 ]
 then
 echo $var1 >> /scripts/temp.log;
elif [ "$random" -eq 2 ] 
then 
 echo $var2 >> /scripts/temp.log;
fi;
done



