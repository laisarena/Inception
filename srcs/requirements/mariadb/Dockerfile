FROM		debian:buster

RUN			apt-get update && apt-get install -y \
			apt-utils \
			mariadb-server \
			procps \
			vim \
			&& mkdir -p /var/run/mysqld \
			&& chown -R mysql:mysql /var/run/mysqld

COPY		./tools/mariadb_entrypoint.sh /usr/local/bin/
COPY		./conf/wordpress.sql /

EXPOSE		3306

ENTRYPOINT ["mariadb_entrypoint.sh"]

CMD			["mysqld", "--bind-address=0.0.0.0"]
