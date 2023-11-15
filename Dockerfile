FROM php:7.4-apache-bullseye

RUN apt update
RUN apt install -y git zip curl
RUN docker-php-ext-install pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN sed -i '/<Directory "\/var\/www">/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf
RUN a2enmod rewrite

RUN usermod -u 1000 www-data && groupmod -g 1000 www-data
USER "1000:1000"