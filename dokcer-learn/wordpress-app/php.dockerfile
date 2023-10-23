FROM php:8.1-fpm-alpine

# by default mysqli not included in the php image
# so we need to install it and enable it
RUN docker-php-ext-install mysqli  && docker-php-ext-enable mysqli

