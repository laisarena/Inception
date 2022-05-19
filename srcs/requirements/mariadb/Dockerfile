FROM debian:buster

WORKDIR /

RUN apt update; \
	apt install -y \
	mariadb-server \
	mariadb-client \
	procps \
	vim

COPY conf/ /srcs/
COPY tools/ /usr/local/bin/


RUN mkdir -p /var/run/mysqld && \
	chown -R mysql:mysql /var/run/mysqld;
	
EXPOSE 3306

ENTRYPOINT ["script.sh"]
CMD ["mysqld"]

#CMD ["mysqld_safe","--datadir='/var/lib/mysql'"]
#CMD ["mysqld","--bind-adress=0.0.0.0"]
# ENTRYPOINT ["mysqld", "--bind-address=0.0.0.0"]
# ENTRYPOINT ["mysqld", "--user=mysql",  "--console"]
