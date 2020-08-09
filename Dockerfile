FROM php:7.1-apache

RUN apt-get update 
RUN apt-get install -y less unzip
RUN apt-get install -y freetype-dev libpng-dev libjpeg-dev libmcrypt-dev 

RUN docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr
RUN docker-php-ext-configure mcrypt
RUN docker-php-ext-install gd mbstring mysqli pdo_mysql zip mcrypt

RUN a2enmod rewrite actions 
RUN a2enmod proxy
RUN a2enmod proxy_balancer
RUN a2enmod proxy_http
RUN service apache2 restart
