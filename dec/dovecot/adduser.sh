#!/bin/bash

# If you want to add the user to /etc/dovecot/passwd you need to change passwd:ro to passwd:rw

if [ -z "$1" ] || [ -z "$2" ]; then

  echo -e "Usage: adduser.sh USERNAME PASSWORD [QUOTA]\nExamples:"
  echo -e "adduser.sh user password"
  echo -e "adduser.sh user password 10G"

  exit
fi
#test:{CRYPT}$2y$05$BoIw4qkZ.Dyf3XHmMA6vsuGQi3bqRXo61j6mNjWrekxBe.WOrYGtC::::::

OUT="$1:"
OUT+=$(doveadm pw -p "$2")
OUT+="::::::"

if ! [ -z "$3" ]; then
OUT+="userdb_quota_rule=*:storage=$3"
fi

echo "$OUT" >> /etc/dovecot/passwd

echo -e "Added the new line to /etc/dovecot/passwd:\n$OUT"

/etc/init.d/dovecot restart