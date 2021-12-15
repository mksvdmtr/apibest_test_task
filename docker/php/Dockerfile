FROM php:7.4-fpm-alpine

RUN apk update && \
    apk add libxml2-dev libzip-dev icu-dev oniguruma-dev

RUN docker-php-ext-install -j$(nproc) bcmath soap exif pcntl zip pdo_mysql intl json tokenizer xml ctype mbstring
RUN docker-php-ext-enable bcmath soap exif pcntl zip pdo_mysql intl json tokenizer xml ctype mbstring

