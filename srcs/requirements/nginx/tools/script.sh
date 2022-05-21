#!/bin/sh

SERVER_CONF=/etc/nginx/sites-available/lfrasson

if [ ! -f "$SERVER_CONF" ]
then
	mkdir /var/www/lfrasson
	mv /srcs/lfrasson /etc/nginx/sites-available/
	sed -i "s/DOMAIN_NAME/$DOMAIN_NAME/g" /etc/nginx/sites-available/lfrasson
	ln -s /etc/nginx/sites-available/lfrasson etc/nginx/sites-enabled/
	mv /srcs/self-signed.conf /etc/nginx/snippets/
	mv /srcs/ssl-params.conf /etc/nginx/snippets/
fi

exec "$@"
