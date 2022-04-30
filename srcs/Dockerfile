FROM debian:buster

WORKDIR /

RUN apt update; \
	apt install -y \
	nginx

ENTRYPOINT	service nginx start && \
			tail -f /dev/null
