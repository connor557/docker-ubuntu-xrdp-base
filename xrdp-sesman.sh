#!/bin/sh

PIDDIR=/var/run/xrdp/

if [ ! -d $PIDDIR ]; then
	mkdir $PIDDIR
fi

exec /usr/sbin/xrdp-sesman --nodaemon >> /var/log/xrdp-sesman_run.log 2>&1
