#!/bin/bash

chmod 0550 /dec/dovecot/adduser.sh

# Setup fetchmail
chown root:root /dec/fetchmail/start.sh
chown root:root /dec/fetchmail/stop.sh
chmod 0770 /dec/fetchmail/start.sh
chmod 0770 /dec/fetchmail/stop.sh

cat /etc/fetchmail/fetchmailrc > /etc/fetchmailrc

for cfile in /etc/fetchmail/jobs/*
do
  cat "$cfile" >> /etc/fetchmailrc
  echo -e "\n\n" >> /etc/fetchmailrc
done

chown fetchmail /etc/fetchmailrc
chmod 0400 /etc/fetchmailrc

mkdir -p -- /var/log/fetchmail
touch /var/log/fetchmail/fetchmail.log
chown -R fetchmail:vmail /var/log/fetchmail
chmod -R 0770 /var/log/fetchmail

mkdir -p -- /var/log/dovecot
touch /var/log/dovecot/dovecot.log
chown -R vmail:vmail /var/log/dovecot
chmod -R 0770 /var/log/dovecot

# Setup rspamd
chmod 0555 /dec/rspamd/learn-ham.sh
chmod 0555 /dec/rspamd/learn-spam.sh