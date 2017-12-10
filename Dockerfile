FROM php:7.1-fpm

# Setup the OS for PHP
RUN docker-php-source extract \
    && apt-get update \
    && apt-get install -y \
    libxml2-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    libicu-dev \
    && rm -rf /tmp/*

# Setup PHP extensions
RUN docker-php-ext-configure opcache \
    && docker-php-ext-configure calendar \
    && docker-php-ext-configure exif \
    && docker-php-ext-configure fileinfo \
    && docker-php-ext-configure gettext \
    && docker-php-ext-configure pdo \
    && docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
    && docker-php-ext-configure json \
    && docker-php-ext-configure session \
    && docker-php-ext-configure ctype \
    && docker-php-ext-configure tokenizer \
    && docker-php-ext-configure simplexml \
    && docker-php-ext-configure dom \
    && docker-php-ext-configure mbstring \
    && docker-php-ext-configure zip \
    && docker-php-ext-configure xml \
    && docker-php-ext-configure intl \
    && docker-php-source delete \\
    && docker-php-ext-install \
    opcache \
    calendar \
    exif \
    fileinfo \
    gettext \
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
    intl

# Get composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
