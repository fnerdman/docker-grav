#!/bin/sh
set -e

if [ -z "$(ls -A /var/www/html)"]; then
	cp -au /usr/src/grav/. /var/www/html/
fi

exec "$@"

