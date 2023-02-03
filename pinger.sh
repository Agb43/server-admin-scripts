#!/bin/bash 


SUM=0  
while true; do
CURRENTTIME=$(date | awk '{print $4}')
ping -c 3 #YOUR IP ADRESS HERE 
if [[ $? != 0 ]]; then

while true; do 
ping -c 1 71.95.40.103
if [[ $? != 0 ]]; then
sleep 10 
else 
break
fi
done
DATE=$(date) 
NEWTIME=$(date | awk '{print $4}')
SUM=$((SUM + 1))
DOWNTIME=$(( "$NEWTIME" - "$CURRENTTIME" ))
echo "$SUM network outages" > ###PATH TO LOG FILE 
echo "there was a outage on $DATE and lasted for $DOWNTIME"  >> ###PATH TO LOG FILE
sleep 3600
else
sleep 3600
fi
done
sleep 3600
