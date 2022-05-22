#!/bin/sh

SERVER_CONF=/etc/nginx/sites-available/lfrasson

if [ ! -f "$SERVER_CONF" ]
then
	openssl req -new -nodes -x509 \
				-newkey rsa:4096 \
				-sha256 \
				-days 365 \
				-keyout $CERTS_KEY \
				-out $CERTS_CRT \
				-subj "/C=BR/ST=Sao Paulo/L=Sao Paulo/O=42 School/OU=lfrasson/CN=$DOMAIN_NAME"

	mkdir -p /var/www/lfrasson
	mv /srcs/lfrasson /etc/nginx/sites-available/
	sed -i "s/DOMAIN_NAME/$DOMAIN_NAME/g" /etc/nginx/sites-available/lfrasson
	ln -s /etc/nginx/sites-available/lfrasson etc/nginx/sites-enabled/
	mv /srcs/ssl-params.conf /etc/nginx/snippets/
	mv /srcs/self-signed.conf /etc/nginx/snippets/
	sed -i -r "s#CERTS_KEY#$CERTS_KEY#g" /etc/nginx/snippets/self-signed.conf
	sed -i -r "s#CERTS_CRT#$CERTS_CRT#g" /etc/nginx/snippets/self-signed.conf
fi

exec "$@"
