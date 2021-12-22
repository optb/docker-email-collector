#!/bin/bash
# stops fetchmail daemon
echo "START_DAEMON=no" > /etc/default/fetchmail
/etc/init.d/fetchmail stop
pkill -9 -u fetchmail