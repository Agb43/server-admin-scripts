#!/bin/bash 


SUM=0  
while true; do
CURRENTTIME=$(date | awk '{print $4}')
ping -c 3 71.95.40.103
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
echo "$SUM network outages" > /mnt/data/Adam/adgow/logs/outagecount.txt 
echo "there was a outage on $DATE and lasted for $DOWNTIME"  >> /mnt/data/Adam/adgow/logs/netlog.txt
sleep 1800
else
sleep 1800
fi
done
sleep 1800
