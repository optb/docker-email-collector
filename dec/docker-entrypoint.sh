#!/bin/bash
set -e

if [ "$1" = 'start' ]; then
  
  chmod 0555 /dec

  chmod 0400 /etc/fetchmail
  chmod u+x /dec/setup.sh
  /dec/setup.sh
    
  sievec /etc/dovecot/sieve/
  sievec /etc/dovecot/sieve/before.d/
  sievec /etc/dovecot/sieve/after.d/

  mkdir -p -- /srv/mail
  chown vmail:vmail /srv/mail
  chmod 0770 /srv/mail
  mkdir -p -- /var/lib/rspamd
  chown _rspamd:_rspamd /var/lib/rspamd
  chmod 0770 /var/lib/rspamd

  if [[ "${FETCHMAIL_ENABLED}" = "1" ]]; then
    /dec/fetchmail/start.sh
  fi

  /etc/init.d/rspamd start
  /usr/sbin/dovecot -F
fi

exec "$@"
