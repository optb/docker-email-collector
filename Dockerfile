FROM dovecot/dovecot:latest

RUN apt-get update && apt-get upgrade \
    && apt-get -y install netbase sudo procps \
    && apt-get -y install fetchmail \
    && echo "fetchmail ALL=(vmail) NOPASSWD:/usr/lib/dovecot/deliver" >> /etc/sudoers \
    && echo "fetchmail ALL=(vmail) NOPASSWD:/usr/bin/rspamc" >> /etc/sudoers \
    && apt-get -y --no-install-recommends install rspamd \
    && apt-get clean


ADD ./etc /etc/

ADD ./usr_local_bin_dec /usr/local/bin/dec/

RUN chmod 0550 /usr/local/bin/dec/docker-entrypoint.sh

ENTRYPOINT ["/sbin/tini","--"]

CMD ["/usr/local/bin/dec/docker-entrypoint.sh","start"]
