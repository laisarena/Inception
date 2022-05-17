FROM debian:buster

WORKDIR /

RUN apt-get update; \
	apt-get install -y \
	wget \
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

RUN mkdir /run/php && \
	mkdir -p /var/www/lfrasson && \
	wget https://wordpress.org/latest.tar.gz && \
	tar -xzvf latest.tar.gz && \
	rm latest.tar.gz && \
	mv wordpress /var/www/lfrasson/wordpress

COPY conf/ /srcs/
COPY tools/ /usr/local/bin/

WORKDIR /var/www/lfrasson/wordpress

EXPOSE 9000 

ENTRYPOINT ["script.sh"]
CMD ["php-fpm7.3", "-F"]
