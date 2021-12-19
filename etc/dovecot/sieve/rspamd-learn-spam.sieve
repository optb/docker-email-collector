require ["vnd.dovecot.pipe", "copy", "imapsieve", "environment", "imap4flags"];

if environment :is "imap.cause" "COPY" {
    pipe :copy "learn-spam.sh";
}

# Catch replied or forwarded spam
elsif anyof (allof (hasflag "\\Answered",
                    environment :contains "imap.changedflags" "\\Answered"),
             allof (hasflag "$Forwarded",
                    environment :contains "imap.changedflags" "$Forwarded")) {
    pipe :copy "learn-spam.sh";
}