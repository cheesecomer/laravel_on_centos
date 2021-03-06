FROM laradock/php-fpm:2.0-72

#####################################
# Check PHP version:
#####################################

RUN php -v | head -n 1 | grep -q "PHP 7.2."

#
#--------------------------------------------------------------------------
# Final Touch
#--------------------------------------------------------------------------
#

ADD ./php-fpm/laravel.ini /usr/local/etc/php/conf.d
ADD ./php-fpm/xlaravel.pool.conf /usr/local/etc/php-fpm.d/
ADD ./php-fpm/php.ini /usr/local/etc/php/php.ini

RUN usermod -u 1000 www-data

COPY ./www /var/www

WORKDIR /var/www

CMD ["php-fpm"]

EXPOSE 9000
