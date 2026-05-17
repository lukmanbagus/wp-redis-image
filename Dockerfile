FROM wordpress:latest

RUN pecl install redis \
    && docker-php-ext-install opcache \
    && docker-php-ext-enable redis opcache

COPY opcache.ini /usr/local/etc/php/conf.d/opcache.ini
COPY custom-php.ini /usr/local/etc/php/conf.d/custom-php.ini