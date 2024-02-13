FROM mediawiki:1.39.6

RUN apt-get update && \
  apt-get install -y asymptote msmtp && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /usr/local/bin/mediawiki-eom-entrypoint

RUN echo 'sendmail_path = "/usr/bin/msmtp -ti"' > /usr/local/etc/php/conf.d/mail.ini

ENTRYPOINT [ "mediawiki-eom-entrypoint" ]
CMD [ "apache2-foreground" ]
