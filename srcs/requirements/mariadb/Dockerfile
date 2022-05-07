FROM debian:buster

WORKDIR /

RUN apt update; \
	apt install -y \
	mariadb-server \
	procps \
	vim

COPY conf/ /srcs/

EXPOSE 3306

# ENTRYPOINT ["mysqld_safe"]
# ENTRYPOINT ["mysqld", "--bind-address=0.0.0.0"]
ENTRYPOINT ["tail", "-f" , "/dev/null"]
