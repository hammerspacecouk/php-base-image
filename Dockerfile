FROM php:fpm-alpine

# Setup the OS for PHP
RUN apk update --no-cache \
    && apk add --no-cache --virtual .php-ext-deps \
    libxml2-dev \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    icu icu-dev \
    php7-intl \
    zip libzip libzip-dev zlib-dev unzip \
    && docker-php-source extract \
    && docker-php-ext-configure opcache \
    && docker-php-ext-configure calendar \
    && docker-php-ext-configure exif \
    && docker-php-ext-configure fileinfo \
    && docker-php-ext-configure intl --enable-intl \
    && docker-php-ext-configure pdo \
    && docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
    && docker-php-ext-configure json \
    && docker-php-ext-configure session \
    && docker-php-ext-configure ctype \
    && docker-php-ext-configure tokenizer \
    && docker-php-ext-configure simplexml \
    && docker-php-ext-configure dom \
    && docker-php-ext-configure mbstring \
    && docker-php-ext-configure zip --with-libzip \
    && docker-php-ext-configure xml \
    && docker-php-ext-install \
    opcache \
    intl \
    calendar \
    exif \
    fileinfo \
    pdo \
    pdo_mysql \
    json \
    session \
    ctype \
    tokenizer \
    simplexml \
    dom \
    mbstring \
    zip \
    xml \
    && docker-php-source delete \
    && apk del .php-ext-deps \
    zlib-dev \
    icu-dev

# Get composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
