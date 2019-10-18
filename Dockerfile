FROM richarvey/nginx-php-fpm:1.5.7

LABEL maintainer="songchaots <songchaots@163.com>"

RUN apk add --virtual --no-cache imagemagick imagemagick-dev autoconf gcc musl-dev make tzdata && \
pecl install redis-4.0.1 && \
pecl install imagick && \
docker-php-ext-enable imagick redis && \
docker-php-ext-install bcmath && \
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
apk del autoconf gcc musl-dev imagemagick imagemagick-dev make && \
docker-php-source delete
