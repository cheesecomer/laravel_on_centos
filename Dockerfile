#
#--------------------------------------------------------------------------
# Image Setup
#--------------------------------------------------------------------------
#
# To edit the 'php-fpm' base Image, visit its repository on Github
#    https://github.com/Laradock/php-fpm
#
# To change its version, see the available Tags on the Docker Hub:
#    https://hub.docker.com/r/laradock/php-fpm/tags/
#
# Note: Base Image name format {image-tag}-{php-version}
#

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

# COPY ./www /var/www/

RUN usermod -u 1000 www-data

COPY ./www /var/www

WORKDIR /var/www

CMD ["php-fpm"]

EXPOSE 9000
