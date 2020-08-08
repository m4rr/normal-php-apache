FROM php:7.2-apache

RUN apt-get update && apt-get install -y freetype-dev libpng-dev libjpeg-dev libmcrypt-dev unzip less \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr
RUN docker-php-ext-configure mcrypt
RUN docker-php-ext-install gd mbstring mysqli pdo_mysql zip mcrypt

RUN a2enmod rewrite actions
