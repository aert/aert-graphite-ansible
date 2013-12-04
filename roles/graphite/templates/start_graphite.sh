#!/bin/bash
set -e
CONF={{app_home}}/graphite.conf.py
VENV={{app_home}}/env
cd {{app_home}}
source $VENV/bin/activate
exec graphite --config=$CONF start http
