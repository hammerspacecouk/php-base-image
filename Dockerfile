FROM php:fpm-alpine

# Get composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Setup the OS for PHP
RUN apk update --no-cache \
    && apk add --update --no-cache \
    libxml2-dev \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    icu-dev \
    zip libzip libzip-dev zlib-dev unzip \
    && docker-php-source extract \
    && docker-php-ext-configure opcache \
    && docker-php-ext-configure calendar \
    && docker-php-ext-configure exif \
    && docker-php-ext-configure fileinfo \
    && docker-php-ext-configure intl --enable-intl \
    && docker-php-ext-configure pdo \
    && docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
    && docker-php-ext-configure session \
    && docker-php-ext-configure ctype \
    && docker-php-ext-configure tokenizer \
    && docker-php-ext-configure simplexml \
    && docker-php-ext-configure dom \
    && docker-php-ext-configure zip \
    && docker-php-ext-configure xml \
    && docker-php-ext-install \
    opcache \
    intl \
    calendar \
    exif \
    fileinfo \
    pdo \
    pdo_mysql \
    session \
    ctype \
    tokenizer \
    simplexml \
    dom \
    zip \
    xml \
    && docker-php-ext-enable zip \
    && docker-php-source delete
