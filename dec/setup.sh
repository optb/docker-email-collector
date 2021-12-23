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
  echo -e "\n\n" >> /etc/fetchmailrc
  cat "$cfile" >> /etc/fetchmailrc
done

chown fetchmail /etc/fetchmailrc
chmod 0400 /etc/fetchmailrc

# setup log files
mkdir -p -- /var/log/fetchmail
touch /var/log/fetchmail/fetchmail.log
chown -R fetchmail:vmail /var/log/fetchmail
chmod -R 0770 /var/log/fetchmail

mkdir -p -- /var/log/dovecot
touch /var/log/dovecot/dovecot.log
chown -R vmail:vmail /var/log/dovecot
chmod -R 0770 /var/log/dovecot

# setup rspamd
chmod 0555 /dec/rspamd/learn-ham.sh
chmod 0555 /dec/rspamd/learn-spam.sh

# setup data folders for mail and spamd
mkdir -p -- /srv/mail
chown vmail:vmail /srv/mail
chmod 0770 /srv/mail
mkdir -p -- /var/lib/rspamd
chown _rspamd:_rspamd /var/lib/rspamd
chmod 0770 /var/lib/rspamd