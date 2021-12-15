#!/bin/sh

set -e

[ -f ./.env ] && echo ".env exists, removing"; rm ./.env || echo "nothing to remove"

cp ./docker/php/.env.example ./.env

composer install

php artisan key:generate

wait() {
    echo -n "waiting for TCP connection to $1 $2"

    while ! nc -w 1 $1 $2 2>/dev/null
    do
        echo -n .
        sleep 1
    done

    printf "\n$1 ok\n"
}

wait db 3306

php artisan migrate

php artisan serve --host 0.0.0.0 --port 8000