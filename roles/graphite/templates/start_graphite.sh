#!/bin/bash
set -e
LOGFILE={{ app_log }}/gunicorn.log
LOGDIR=$(dirname $LOGFILE)
NUM_WORKERS=3
# user/group to run as
USER=www-data
GROUP=www-data
PORT=8082
IP=0.0.0.0
SITE={{prefix}}
cd $SITE
test -d $LOGDIR || mkdir -p $LOGDIR
exec gunicorn_django -b $IP:$PORT -w $NUM_WORKERS \
  --user=$USER --group=$GROUP --log-level=debug --log-file=$LOGFILE \
  {{prefix}}/webapp/graphite/settings.py 2>>$LOGFILE
