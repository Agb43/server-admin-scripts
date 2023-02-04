# server admin scripts

these scripts are desgined for use with a server for automation purposes. Mainly with truenas/zfs.

encrypterr.sh -- automatically encrypts all files in a folder of your choosing with a public key of your choosing.
server-pinger.sh -- pings a server of your choose and alerts you if the server is down. This requires a mail server being configured on an already exisiting server. Also requires internet access on at least one of the servers. This can be useful for monitoring offsite servers or services.
pingerv2.sh -- pings your router ip and creates a running log in a directory of your choosing. One tallys the amount of times the internet has been down and anohter logs the time of outage and duration

