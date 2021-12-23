#!/bin/bash
set -e

if [ "$1" = 'start' ]; then
  
  echo "Starting docker-email-collector..."
  chmod 0555 /dec

  echo "- setup files and permissions"
  chmod 0400 /etc/fetchmail
  chmod u+x /dec/setup.sh
  /dec/setup.sh
    
  echo "- compile global sieve scripts"
  sievec /etc/dovecot/sieve/
  sievec /etc/dovecot/sieve/before.d/
  sievec /etc/dovecot/sieve/after.d/


  if [[ "${FETCHMAIL_ENABLED}" = "1" ]]; then
    echo "- start fetchmail"
    /dec/fetchmail/start.sh
  fi

  echo "- start rspamd"
  /etc/init.d/rspamd start
  echo "- start dovecot"
  /usr/sbin/dovecot -F
fi

exec "$@"
