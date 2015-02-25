#!/bin/sh

RSAKEYS=/etc/xrdp/rsakeys.ini
PIDDIR=/var/run/xrdp/

if [ ! -d $PIDDIR ]; then
	mkdir $PIDDIR
fi

if [ ! -f $RSAKEYS ]; then
	echo "Generating xrdp RSA keys..."
	(umask 077 ; xrdp-keygen xrdp $RSAKEYS)
fi

exec /usr/sbin/xrdp --nodaemon >> /var/log/xrdp_run.log 2>&1
