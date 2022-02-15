FROM debian:buster

LABEL version = "1" maintainer = "abonte-l <abonte-l@student.42.fr>"

ADD . /var/opt/

RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y \
		mariadb-server \
		vim \
		sudo

COPY ./tools/my.cnf /etc/mysql/my.cnf
COPY ./tools/mysql_setup.sh /usr/local/bin/mysql_setup.sh

RUN chmod +x  /usr/local/bin/*

ENV			MARIADB_USR=mariadb_user			\
			MARIADB_PWD=mariadb_password	\
			MARIADB_DB=mariadb_database	\
			MARIADB_PORT=3306


RUN sh /usr/local/bin/mysql_setup.sh

EXPOSE		3306

CMD ["mysqld_safe"]