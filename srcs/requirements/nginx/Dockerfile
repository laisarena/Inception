FROM debian:buster

WORKDIR /

RUN apt update; \
	apt install -y \
	nginx \
	openssl \
	procps \
	vim

COPY conf/ /srcs/
COPY ./tools/nginx_entrypoint.sh /usr/local/bin/

EXPOSE 443

ENTRYPOINT ["nginx_entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
