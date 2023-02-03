#!/bin/bash

ping -c 1 #### IP ADRESS OF SERVER ####
  if [[ $? = 1 ]]; then
    echo "The ##server## is offline" | mail -s #SERVER STATUS# #EMAIL ADDRESS#
      while true; do
        ping -c 1 ##### IP ADRESS OF SERVER ####
          if [[ $? = 1 ]]; then
            continue
          else
            echo "The ##server## is back online" | mail -s #SERVER STATUS# #EMAIL ADDRESS#
           break
           exit
          fi
      done
    fi
