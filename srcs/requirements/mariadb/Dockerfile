# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abonte-l <abonte-l@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/02/17 00:05:39 by abonte-l          #+#    #+#              #
#    Updated: 2022/02/17 00:08:48 by abonte-l         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

LABEL version = "1" maintainer = "abonte-l <abonte-l@student.42.fr>"

RUN apt-get update \
	&& apt-get install -y \
		mariadb-server

COPY ./tools/my.cnf /etc/mysql/my.cnf
COPY ./tools/mysql_setup.sh /usr/local/bin/mysql_setup.sh

RUN chmod +x  /usr/local/bin/*

EXPOSE		3306

CMD ["sh",  "/usr/local/bin/mysql_setup.sh"]