#!/bin/sh
# mount /dev/sdd1 /mnt/backup #mount external drive if you neede it

while true
do
  rsync -avz /net/ /data-pool/  --log-file=/var/log/backup.log
  inotifywait -r /net/
done
