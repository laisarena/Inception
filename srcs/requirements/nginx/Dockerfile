FROM debian:buster

WORKDIR /

RUN apt update; \
	apt install -y \
	nginx \
	openssl \
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


RUN mkdir /var/www/lfrasson && \
	mv /srcs/lfrasson /etc/nginx/sites-available/ && \
	ln -s /etc/nginx/sites-available/lfrasson etc/nginx/sites-enabled/ && \
	mv /srcs/self-signed.conf /etc/nginx/snippets/ && \
	mv /srcs/ssl-params.conf /etc/nginx/snippets/ && \
	mv /srcs/index.html /var/www/lfrasson/

EXPOSE 443

#ENTRYPOINT ["tail", "-f", "/dev/null"]
ENTRYPOINT ["nginx", "-g", "daemon off;"]
