# server admin scripts

these scripts are desgined for use with a server for automation purposes. Mainly with truenas/zfs.

encrypterr.sh -- automatically encrypts all files in a folder of your choosing with a public key of your choosing. Original files are removed only if encryption is successfull 

server-pinger.sh -- pings a server of your choose and alerts you if the server is down. This requires a mail server being configured on an already exisiting server. Also requires internet access on at least one of the servers. This can be useful for monitoring offsite servers or services.

pingerv2.sh -- pings your router ip and creates a running log in a directory of your choosing. One tallys the amount of times the internet has been down and anohter logs the time of outage and duration

smartcronv2.sh -- checks health status of all disks in a zpool and prints results to a log. Should be used in combination with a seperate script that performs the inital smart test

threshhold-checker.sh -- checks zpools to see if a threshhold of 80% has been reached. Then alerts you if they have. This also relies on a mail server being set up.

