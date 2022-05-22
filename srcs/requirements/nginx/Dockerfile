FROM debian:buster

WORKDIR /

RUN apt update; \
	apt install -y \
	nginx \
	openssl \
	procps \
	vim

COPY conf/ /srcs/
COPY ./tools/script.sh /usr/local/bin/

EXPOSE 443

ENTRYPOINT ["script.sh"]
CMD ["nginx", "-g", "daemon off;"]
