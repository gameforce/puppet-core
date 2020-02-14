#!/bin/bash

# Number of arguments should be at least 1
if [ $# -lt 1 ]; then
  echo "Usage: $0 centos-version-number"
  exit 1
fi

VERSION=$1

# Change these variables as appropriate
LOCK_FILE=/tmp/centos_mirror_rsync_updates
DOWNLOAD_LOCATION=rsync://mirrors.cat.pdx.edu/centos/
TARGET_DIR=/var/www/html/vhosts/kickstart/centos
RSYNC_RETVAL=1

if [ -f $LOCK_FILE ]; then
  echo "CentOS updates via rsync already running."
  exit 0
fi

echo "Starting rsync from $DOWNLOAD_LOCATION/$VERSION to $TARGET_DIR/$VERSION..."
mkdir -p $TARGET_DIR/$VERSION

touch $LOCK_FILE

# add --exclude as necessary
rsync  -avSHP --delete --exclude "centosplus" --exclude "contrib" --exclude "cr" --exclude "extras" --exclude "fasttrack" --exclude "isos" --exclude "os/i386" --exclude "updates/i386" $DOWNLOAD_LOCATION/$VERSION $TARGET_DIR/
RSYNC_RETVAL=$?

/bin/rm -f $LOCK_FILE

if [ $RSYNC_RETVAL -eq 0 ]; then
  echo "Finished rsync from $DOWNLOAD_LOCATION/$VERSION to $TARGET_DIR/$VERSION."
fi

exit 0
