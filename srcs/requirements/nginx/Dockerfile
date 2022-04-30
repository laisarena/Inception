FROM debian:buster

WORKDIR /

RUN apt update; \
	apt install -y \
	nginx \
	procps

ENTRYPOINT ["nginx", "-g", "daemon off;"]
