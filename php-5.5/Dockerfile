FROM php:5.5-alpine
RUN apk add --update bash && rm -rf /var/cache/apk/*

# Uncomment the furhter line to add needed extension(s)
# RUN docker-php-ext-install iconv

# Uncomment the furhter line to add and enable a needed pecl extension(s)
# RUN pecl install memcached && docker-php-ext-enable memcached

VOLUME ["/app"]
WORKDIR /app
ENTRYPOINT ["/app/entrypoint.sh"]
