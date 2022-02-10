FROM debian:buster

LABEL version = "1" maintainer = "abonte-l <abonte-l@student.42.fr>"

ADD . /var/opt/

RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y \
		mariadb-server \
		vim \
		sudo

COPY ./COPY/my.cnf /etc/mysql/my.cnf
COPY ./COPY/mysql_setup.sh /usr/local/bin/mysql_setup.sh

RUN chmod +x  /usr/local/bin/*

ENV			MARIADB_USER=mariadb_user			\
			MARIADB_PASSWORD=mariadb_password	\
			MARIADB_DATABASE=mariadb_database	\
			MARIADB_PORT=3306


RUN sh /usr/local/bin/mysql_setup.sh

EXPOSE		3306

CMD ["mysqld_safe"]