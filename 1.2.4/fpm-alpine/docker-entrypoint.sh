#!/bin/sh
set -e

if [ -z "$(ls -A /var/www/html)"]; then
	cp -a /usr/src/grav/. /var/www/html/
fi

exec "$@"

