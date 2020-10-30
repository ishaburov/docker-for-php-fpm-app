FROM ishaburov/php-fpm:7.4.9

# Install MySQL
RUN \
  apt-get update && \
  echo "mysql-server mysql-server/root_password password root" | debconf-set-selections && \
  echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections && \
  apt-get install -y mariadb-server mariadb-client && \
  apt-get autoclean && apt-get clean && apt-get autoremove


ADD ./www/laravel /var/www/test
ADD ./docker/sh/init_phpunit.sh /scripts/init.sh
RUN chmod -R 777 /scripts
WORKDIR /var/www/test

ENTRYPOINT ["/scripts/init.sh"]
