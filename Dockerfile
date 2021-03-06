FROM php:7.4-apache

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        zlib1g-dev \
        libxml2-dev \
        libzip-dev \
        libonig-dev \
    \
    && docker-php-ext-configure gd \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install zip \
    # && docker-php-ext-install mbstring \
    # && docker-php-ext-install mcrypt \
    && docker-php-source delete

RUN a2enmod rewrite
RUN a2enmod proxy
RUN a2enmod proxy_balancer
RUN a2enmod proxy_http
