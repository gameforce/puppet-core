#!/bin/sh
mount /dev/sdd1 /mnt/backup

while true
do 
  rsync -avz /data-pool/ /mnt/backup/  --log-file=/var/log/backup.log
  inotifywait -r /data-pool/
done
