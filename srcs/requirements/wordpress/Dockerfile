FROM debian:buster

WORKDIR /

RUN apt-get update; \
	apt-get install -y \
	wget \
	php7.3-fpm \
	procps \
	vim


RUN mkdir -p /var/www/lfrasson && \
	wget https://wordpress.org/latest.tar.gz && \
	tar -xzvf latest.tar.gz && \
	mv wordpress /var/www/lfrasson/wordpress

COPY conf/ /srcs/
COPY tools/ /usr/local/bin/

EXPOSE 9000 

ENTRYPOINT ["tail", "-f", "/dev/null"]
#ENTRYPOINT ["script.sh"]
