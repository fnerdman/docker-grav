FROM php:fpm-alpine

RUN set -xe \
    && apk --no-cache add libpng \
    && apk --no-cache add --virtual .build-deps libpng-dev unzip \
    && docker-php-ext-install gd zip \
    && mkdir -p /usr/src/grav \
    && curl -L -o /usr/src/grav/grav-admin.zip \
       'https://github.com/getgrav/grav/releases/download/1.2.4/grav-admin-v1.2.4.zip' \
    && ln -s /usr/src/grav /usr/src/grav/grav-admin \
    && unzip /usr/src/grav/grav-admin.zip -d /usr/src/grav \
    && rm /usr/src/grav/grav-admin.zip /usr/src/grav/grav-admin \
    && chown -R www-data:www-data /usr/src/grav \
    && apk del .build-deps

COPY ./docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/bin/sh", "/entrypoint.sh" ]
CMD [ "php-fpm" ]
