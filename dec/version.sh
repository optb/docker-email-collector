#! /bin/sh

echo "Dovecot:"
dovecot --version
echo "---"

echo "Rspamd:"
rspamd --version
echo "---"

echo "Fetchmail:"
fetchmail --version 1|grep release