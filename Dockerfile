FROM centos:8

LABEL maintainer="Bryan Pedini <b.pedini@bjphoster.com>"

RUN dnf makecache && \
    dnf install -y epel-release https://rpms.remirepo.net/enterprise/remi-release-8.rpm && \
    dnf module install -y php:remi-7.4 && \
    dnf clean all

RUN mkdir /site && \
    chown nginx:nginx /var/lib/php -R && \
    chown nginx:nginx /site -R

COPY php.ini /etc/php.ini
COPY php-fpm.conf /etc/php-fpm.conf
COPY www.conf /etc/php-fpm.d/www.conf

CMD php-fpm
