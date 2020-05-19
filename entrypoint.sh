#!/bin/sh

set -e

cat >> /etc/msmtprc <<-EOCFG
account         default
host         ${SMTP_HOST}
port         ${SMTP_PORT}
timeout         30
auth         on
tls          on
tls_starttls    on
tls_trust_file     /etc/ssl/certs/ca-certificates.crt
syslog          on

auto_from       off
user         ${SMTP_USER}
password        ${SMTP_PASS}
from         ${SMTP_FROM}
maildomain      ${SMTP_DOMAIN}
EOCFG

exec "$@"
