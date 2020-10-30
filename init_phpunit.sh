#!/bin/bash

service mysql start


if [ ! -d /var/lib/mysql/test ] ; then
    mysql -sse "CREATE USER 'test'@'127.0.0.1' IDENTIFIED BY 'test';"
    mysql -sse "GRANT ALL PRIVILEGES ON * . * TO 'test'@'127.0.0.1';"
    mysql -sse "FLUSH PRIVILEGES;"
    mysql -sse "CREATE DATABASE test;"

    if [ -d /var/lib/mysql/test ] ; then
        echo -e "Database was created!"
    else
        echo -e "Database was not created."
    fi
fi

composer install --no-interaction --no-progress --prefer-dist

php -f vendor/bin/phpunit ||  exit 1;
