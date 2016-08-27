#!/usr/bin/env bash

set -e

DEBUG=0
ARGUMENTS=""

for i in "$@"
do
case $i in
    --debug)
    DEBUG=1
    shift
    ;;
    --command=*)
    ARGUMENTS="${i#*=}"
    shift
    ;;
    *)
    ;;
esac
done

if [ $DEBUG -eq 0 ]; then
    docker-compose build &>/dev/null
    docker-compose up -d &>/dev/null
else
    docker-compose build
    docker-compose up -d
fi

if [ -z "$ARGUMENTS" ]; then
    printf "\033c"
    echo -e "Type the command to run your tests in different PHP versions, followed by [ENTER]:"
    echo -e "For example: 'phpunit.phar -c app/phpunit.xml'\n"
    read ARGUMENTS
fi

printf "\033c"
echo "Run tests for PHP 5.5 ..."
docker-compose run php-5.5 php -v
docker-compose run php-5.5 php $ARGUMENTS

printf "\033c"
echo "Run tests for PHP 5.6 ..."
docker-compose run php-5.6 php -v
docker-compose run php-5.6 php $ARGUMENTS

printf "\033c"
echo "Run tests for PHP 7.0 ..."
docker-compose run php-7.0 php -v
docker-compose run php-7.0 php $ARGUMENTS

printf "\033c"
echo "Run tests for HHVM ..."
docker-compose run hhvm php -v
docker-compose run hhvm php $ARGUMENTS
