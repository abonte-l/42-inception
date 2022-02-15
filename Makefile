#Dockerfile vars
SHELL =	/bin/bash
#vars
IMAGENAME =	inception
IMAGEFULLNAME=${IMAGENAME}


help:
	@echo "Makefile commands:"
	@echo "build // Build All Images and launch docker-compose"
	@echo "build_images // Build All Images"
	@echo "delete_containers // Clean All Containter"
	@echo "delete_images // Clean All Images"
	@echo "docker_compose // Launch docker-compose"
	@echo "Purge // Clean All"
	@echo "all"


build:
	@docker build -t ${IMAGEFULLNAME}/nginx:1.0 ./srcs/requirements/nginx/
	@docker build -t ${IMAGEFULLNAME}/wordpress:1.0 ./srcs/requirements/wordpress/
	@docker build -t ${IMAGEFULLNAME}/mariadb:1.0 ./srcs/requirements/mariadb/
	@cd srcs && docker-compose up -d
build_images:
	@docker build -t ${IMAGEFULLNAME}/nginx:1.0 ./srcs/requirements/nginx/
	@docker build -t ${IMAGEFULLNAME}/wordpress:1.0 ./srcs/requirements/wordpress/
	@docker build -t ${IMAGEFULLNAME}/mariadb:1.0 ./srcs/requirements/mariadb/
delete_containers:
	@docker rm -f $$(docker ps -a -q)
delete_images:
	@docker rmi -f $$(docker images -aq)
purge: delete_containers delete_images
docker_compose:
	@cd srcs && docker-compose up -d
all: build docker_compose

.PHONY: all help build build_images delete_containers delete_images purge docker_compose