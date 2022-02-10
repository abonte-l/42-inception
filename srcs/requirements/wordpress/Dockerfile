FROM debian:buster

LABEL version = "1" maintainer = "abonte-l <abonte-l@student.42.fr>"

RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y \
	php7.3 \
	php-fpm	\
	mariadb-client \
	bash \
	curl \
	vim	 \
	sudo

COPY ./tools/wordpress.tar.gz /var/www/html/

WORKDIR /var/www/html/

ENV	MARIADB_HOST="mariadb" \
	MARIADB_DB="wordpress" \
	MARIADB_USR="abonte-l" \
	MARIADB_PWD="lol" \
	MARIADB_PORT=3306	

RUN tar xf ./wordpress.tar.gz && rm -rf wordpress.tar.gz \
&& chmod 755 -R wordpress

RUN	mkdir /var/log/php-fpm \
	mkdir /scripts
COPY ./config/php-fpm.conf /etc/php7/php-fpm.conf
COPY ./config/www.conf /etc/php7/php-fpm.d/www.conf

COPY ./tools /config
COPY ./tools/wp-config.php ./
COPY ./tools/wp_setup.sh /scripts/

EXPOSE 9000

HEALTHCHECK --interval=30s --timeout=3s CMD --fail https://127.0.0.1/ || exit 1
ENTRYPOINT ["bash", "/scripts/wp_setup.sh"]