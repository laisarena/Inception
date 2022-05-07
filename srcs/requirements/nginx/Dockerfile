FROM debian:buster

WORKDIR /

RUN apt update; \
	apt install -y \
	nginx \
	openssl \
	php7.3 \
	php7.3-fpm \
	php7.3-opcache \
	php7.3-cli \
	php7.3-gd \
	php7.3-curl \
	php7.3-mysql \
	php7.3-mbstring \
	procps \
	vim

COPY conf/ /srcs/

RUN openssl req -new -nodes -x509 \
	-newkey rsa:4096 \
	-sha256 \
	-days 365 \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt \
	-subj "/C=BR/ST=Sao Paulo/L=Sao Paulo/O=42 School/OU=lfrasson/CN=lfrasson.42.com"

ENV DOMAIN_NAME "ftserver.com" 

RUN mkdir /var/www/lfrasson && \
	mv /srcs/lfrasson /etc/nginx/sites-available/ && \
	sed -i "s/DOMAIN_NAME/$DOMAIN_NAME/g" /etc/nginx/sites-available/lfrasson && \
	ln -s /etc/nginx/sites-available/lfrasson etc/nginx/sites-enabled/ && \
	mv /srcs/self-signed.conf /etc/nginx/snippets/ && \
	mv /srcs/ssl-params.conf /etc/nginx/snippets/ && \
	mv /srcs/index.php /var/www/lfrasson/

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
#CMD ["service", "php7.3-fpm", "start"]
