FROM php:apache

RUN set -xe \
    && buildDeps=" \
          unzip \
          libpng12-dev \
    " \
    && apt-get update && apt-get install -y libpng12-0 $buildDeps --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install gd zip \
    && mkdir -p /usr/src/grav \
    && curl -L -o /usr/src/grav/grav-admin.zip \
       'https://github.com/getgrav/grav/releases/download/1.2.4/grav-admin-v1.2.4.zip' \
    && ln -s /usr/src/grav /usr/src/grav/grav-admin \
    && unzip /usr/src/grav/grav-admin.zip -d /usr/src/grav \
    && rm /usr/src/grav/grav-admin.zip /usr/src/grav/grav-admin \
    && chown -R www-data:www-data /usr/src/grav \
    && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false $buildDeps

RUN a2enmod rewrite

COPY ./docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/bin/sh", "/entrypoint.sh" ]
CMD [ "apache2-foreground" ]
