FROM debian:buster

WORKDIR /

RUN apt update; \
	apt install -y \
	mariadb-server \
	procps \
	vim

COPY conf/ /srcs/
COPY tools/ /usr/local/bin/

EXPOSE 3306

RUN mkdir -p /var/run/mysqld; \
	chown -R mysql:mysql /var/run/mysqld

ENTRYPOINT ["mysqld"]
#ENTRYPOINT ["script.sh"]
# ENTRYPOINT ["tail", "-f", "/dev/null"]
#CMD ["mysqld_safe","--datadir='/var/lib/mysql'"]
#CMD ["mysqld","--bind-adress=0.0.0.0"]
# ENTRYPOINT ["mysqld_safe"]
# ENTRYPOINT ["mysqld", "--bind-address=0.0.0.0"]
# ENTRYPOINT ["mysqld", "--user=mysql",  "--console"]
