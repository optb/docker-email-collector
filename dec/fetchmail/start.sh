#!/bin/bash
# starts fetchmail daemon
cat /etc/fetchmail/default.start > /etc/default/fetchmail
/etc/init.d/fetchmail start