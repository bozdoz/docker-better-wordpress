#!/bin/sh

# Setup mail
if [ -n "$MAIL_HOST" ]; then
    cat <<EOF > /etc/msmtprc
account default
tls on
auth on
host ${MAIL_HOST}
port 587
user ${MAIL_USER}
from ${MAIL_USER}
password ${MAIL_PASS}
EOF
    chmod 600 /etc/msmtprc
    chown www-data /etc/msmtprc

    echo "sendmail_path = \"/usr/bin/msmtp -C /etc/msmtprc -a default -t\"" >> /usr/local/etc/php/conf.d/sendmail.ini
fi

apache2-foreground