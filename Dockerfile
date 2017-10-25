FROM php:7.1-apache

RUN requirements="zlib1g-dev libicu-dev git curl libmcrypt-dev libxml2-dev libjpeg-dev libpng-dev " \
    && apt-get update && apt-get install -y $requirements && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install intl \
    && docker-php-ext-install zip \
    && docker-php-ext-install mcrypt \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install soap \
    && docker-php-ext-install gd \
    && docker-php-ext-install opcache \
    && docker-php-ext-install bcmath \
    && apt-get purge --auto-remove -y

RUN a2enmod rewrite

ADD config/vhost.conf /etc/apache2/sites-available/000-default.conf
ADD config/php.ini /usr/local/etc/php/php.ini

# Install composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/bin/composer

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
  apt-get install -y nodejs

RUN mkdir /app
WORKDIR /app

RUN usermod -u 1000 www-data
RUN chown www-data:www-data /app
