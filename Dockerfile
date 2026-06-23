FROM wordpress:latest

RUN pecl install redis \
    && docker-php-ext-install opcache \
    && docker-php-ext-enable redis opcache

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

RUN apt-get update && apt-get install -y vim && rm -rf /var/lib/apt/lists/*

COPY opcache.ini /usr/local/etc/php/conf.d/opcache.ini
COPY custom-php.ini /usr/local/etc/php/conf.d/custom-php.ini