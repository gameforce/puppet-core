#!/bin/bash
if [ -f /var/lock/subsys/rsync_updates ]; then
    echo "Updates via rsync already running."
    exit 0
fi
if [ -d /var/www/hmtl/vhosts/repo/centos/7.3 ] ; then
    touch /var/lock/subsys/rsync_updates
    rsync  -avSHP --delete --exclude "local*" --exclude "isos" nearby.rsync.centos.net::CentOS/6.8/ /var/www/html/vhosts/repo/centos/7.3/
    /bin/rm -f /var/lock/subsys/rsync_updates
else
    echo "Target directory /share/CentOS/6.8 not present."
fi
