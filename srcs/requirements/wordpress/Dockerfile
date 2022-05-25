# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abonte-l <abonte-l@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/02/17 00:07:15 by abonte-l          #+#    #+#              #
#    Updated: 2022/02/17 00:09:27 by abonte-l         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

LABEL version = "1" maintainer = "abonte-l <abonte-l@student.42.fr>"

RUN apt-get update \
	&& apt-get install -y \
	php7.3 			\
	php7.3-mysql	\
	php-fpm			\
	curl			\
	mariadb-client 

WORKDIR /var/www/html/

RUN	mkdir /var/log/php-fpm /scripts /run/php
COPY ./tools/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY ./tools/wp_setup.sh /scripts/

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&	\
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

CMD ["/bin/bash", "/scripts/wp_setup.sh"]
