FROM debian:buster

WORKDIR /

RUN apt update; \
	apt install -y \
	procps \
	vim

COPY conf/ /srcs/
COPY tools/ /usr/local/bin/

EXPOSE 9000 

ENTRYPOINT ["tail", "-f", "/dev/null"]
#ENTRYPOINT ["script.sh"]
