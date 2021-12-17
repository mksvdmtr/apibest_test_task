FROM php:7.4-cli-alpine
ARG UID
ARG GID

RUN adduser --disabled-password -u ${UID} -g ${GID} devel

RUN apk update && \
    apk add libxml2-dev libzip-dev icu-dev oniguruma-dev netcat-openbsd

RUN docker-php-ext-install -j$(nproc) bcmath soap exif pcntl zip pdo_mysql intl json tokenizer xml ctype mbstring
RUN docker-php-ext-enable bcmath soap exif pcntl zip pdo_mysql intl json tokenizer xml ctype mbstring

RUN curl https://getcomposer.org/composer-stable.phar -o /bin/composer && chmod +x /bin/composer

WORKDIR /app

USER devel

ENTRYPOINT [ "docker/php/entrypoint.sh" ]

