FROM wordpress:6.2.0-php8.0-apache

# install mail
RUN apt-get update && \
  apt-get install -y msmtp && \
  rm -rf /var/lib/apt/lists/*

# better uploads
COPY ./inc/uploads.ini /usr/local/etc/php/conf.d/uploads.ini

# scripts to configure mail
# rename to apache2- to work around entrypoint.sh L26
COPY docker-cmd.sh /usr/local/bin/apache2-init.sh

RUN chmod 755 /usr/local/bin/apache2-init.sh

CMD [ "apache2-init.sh" ]
