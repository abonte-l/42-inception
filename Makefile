# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abonte-l <abonte-l@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/02/17 00:08:00 by abonte-l          #+#    #+#              #
#    Updated: 2022/02/17 03:15:55 by abonte-l         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


build:
	@cd srcs && docker-compose up -d

delete_containers:
	@docker rm -f $$(docker ps -a -q)

delete_images:
	@docker rmi -f $$(docker images -aq)

purge: delete_containers delete_images 

re: purge build

all: build

.PHONY: all re build delete_containers delete_images purge 
