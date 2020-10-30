FROM php:7.4.9-fpm

RUN apt-get update && apt-get install -y \
 zip \
 ffmpeg \
 curl \
 libmcrypt-dev \
 libpng-dev \
 imagemagick \
 exiftool \
 supervisor \
 libfreetype6-dev \
 libjpeg62-turbo-dev \
 libzip-dev \
 && docker-php-ext-configure bcmath \
 && docker-php-ext-configure exif \
 && docker-php-ext-install zip \
 && docker-php-ext-configure zip \
 && docker-php-ext-install bcmath \
 && docker-php-ext-install exif \
 && docker-php-ext-install mysqli \
 && docker-php-ext-install pdo_mysql \
 && docker-php-ext-install pcntl \
 && docker-php-ext-install opcache \
 && docker-php-ext-configure gd --with-freetype --with-jpeg \
 && NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) \
 && docker-php-ext-install -j${NPROC} gd \
 && mkdir /home/supervisord


# Install imagick
RUN apt-get update && apt-get install -y \
    libmagickwand-dev --no-install-recommends \
    && pecl install imagick \
	&& docker-php-ext-enable imagick

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
