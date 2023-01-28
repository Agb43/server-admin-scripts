#!/bin/bash

echo "" > smartcronlog.txt
pools=("$( zpool list | awk '{print $1}' | sed -e "s/NAME//g" )")

for pool in "${pools[@]}"; do
  diskid=("$( zpool "$pool" | awk '{print $1}' | grep "gptid" )")
    for diskid in "${diskid[@]}"; do
      devicetocheck=$(geom -t | grep "$diskid" | awk '{print $1}' | sed -e "s|p[0-9]*||g" | awk '{print $1}')
      smartctl -a /dev/"$devicetocheck" >> smartcronlog.txt
    done
done  
