#!/bin/bash

HEALTHCHECKER=($(zpool list | awk '{print $10}' | sed s/"HEALTH"//))
DATE=$(date)

#INITIATE INFINITE LOOP, HEALTHCHECKER LOOKS AT ZPOOL LIST FILTERING OUT HEALTH AND ONLY PRINTING ONLINE/THE 10TH VARIBALE 

while true; do

#FOR LOOPS CHECKS FOR ANY POOL THAT ARE NOT ONNLINE USING $POOL TO SPECIFY THE POOL GOING OVER THE ARRAY OF RESULTS FROM HEALTHCHECKER

for pool in "${HEALTHCHECKER[@]}"; do
if [[ $pool != "ONLINE" ]]; then
echo "running smart"

#DAMAGED POOL IS = TO THE OUTPUT OF ZPOOL LIST WITH THE 1ST VARIBALE BEING PRINTED (POOL NAME) IF THE 10TH VARIABLE IS != ONLINE 

DamagedPool=$(zpool list | awk '{if (( "$10" != "ONLINE" )) print $1}')
zpool list | awk '{if (( "$10" != "ONLINE" )) print $1}' > /mnt/data/Adam/adgow/logs/"$DATE"PoolHealthLog.txt

#FIND NAMES OF DAMAGED DISKS BY GREPPING GPTIDS STORING EACH ID IN AN ARRAY TO BE PARSED THROUGH

DISKSTOCHECK=($(zpool status "$DamagedPool" | grep gptid | awk '{if (( $2 != "ONLINE" )) print $1}'))
for Disk in "${DISKSTOCHECK[@]}"; do   #ITERATE OVER GPTID VLAUES TO FIND DISK NAME AND PERFORM SMART TEST
SMARTDISK=$(geom -t | grep "$Disk" | sed -e 's/p[0-9]*//g' | awk '{print $1}' | head -n 1)
smartctl -type offline /dev/"$SMARTDISK" > ##path to log file##
EXACTDISK=$(diskinfo -v $Disk | grep "# Disk ident." | awk '{print $1}')
CHECK=$(cat ####path to log file####| grep -o "FAILED" | sed -n 1p)
if [[ -n $CHECK ]]; then
echo "$SMARTDISK in $DamagedPool requires IMMEDIATE ATTENTION, please check PoolHealthLog.txt for offline smart test results and perform more smart tests if neccessary. Furthermore, the offline smart test failed." | mail -s URGENT ###email address### - ##path to log file###
else
echo "$SMARTDISK in $DamagedPool requires IMMMEDIATE ATTENTION, please check PoolHealthLog.txt for offline smart test results and perform more smart tests if neccessary. The failed disk has the identifier $EXACTDISK" | mail -s "URGENT" ###email address### - ###path to log file###
fi
done #END OF THIRD FOR LOOP
fi
done #END OF SECOND FOR LOOP
sleep 3600
done #END OF WHILE TRUE LOOP
