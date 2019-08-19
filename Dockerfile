FROM wordpress

# install mail
RUN apt-get update && \
  apt-get install -y msmtp

# better uploads
COPY ./inc/uploads.ini /usr/local/etc/php/conf.d/uploads.ini

# scripts to configure mail
# rename to apache2- to work around entrypoint.sh
# see: https://github.com/docker-library/wordpress/blob/master/docker-entrypoint.sh#L26
COPY docker-cmd.sh /usr/local/bin/apache2-init.sh
RUN chmod 755 /usr/local/bin/apache2-init.sh

CMD [ "apache2-init.sh" ]
