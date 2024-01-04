FROM php:7.2-apache-buster
RUN a2enmod rewrite
RUN docker-php-ext-install pdo pdo_mysql
RUN apt-get update && \
    apt-get install -y --no-install-recommends libmcrypt-dev libpng16-16 libfreetype6 libfreetype6-dev libpng-dev && \
    docker-php-ext-install gd && \
    apt-get remove -y libpng-dev libfreetype6-dev && \
    apt-get autoremove -y
RUN apt-get install -y --no-install-recommends libmcrypt4 libmcrypt-dev && \
    pecl install mcrypt-1.0.1 && \
    docker-php-ext-enable mcrypt
