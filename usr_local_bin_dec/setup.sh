#!/bin/bash

# Setup fetchmail
chown root:root /usr/local/bin/dec/fetchmail/start.sh
chown root:root /usr/local/bin/dec/fetchmail/stop.sh
chmod 0770 /usr/local/bin/dec/fetchmail/start.sh
chmod 0770 /usr/local/bin/dec/fetchmail/stop.sh

cat /etc/fetchmail/fetchmailrc > /etc/fetchmailrc

for cfile in /etc/fetchmail/jobs/*
do
  cat "$cfile" >> /etc/fetchmailrc
  echo -e "\n\n" >> /etc/fetchmailrc
done

chown fetchmail /etc/fetchmailrc
chmod 0400 /etc/fetchmailrc

# Setup rspamd
chmod 0555 /usr/local/bin/dec/rspamd/learn-ham.sh
chmod 0555 /usr/local/bin/dec/rspamd/learn-spam.sh