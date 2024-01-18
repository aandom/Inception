# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aandom <aandom@student.abudhabi42.ae>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/29 03:15:37 by aandom            #+#    #+#              #
#    Updated: 2023/10/29 03:15:37 by aandom           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

name = inception
err = > /dev/null 2>&1

all: build

build:
	@printf "Building configuration ${name}...\n"
	@bash ./srcs/requirements/wordpress/conf/createdir.sh
	@docker compose -f ./srcs/docker-compose.yml up -d --build

start : 
	@printf "Starting  existing containers of ${name}...\n"
	@docker compose -f ./srcs/docker-compose.yml start 

stop : 
	@printf "Stoping Running containers of ${name}...\n"
	@docker compose -f ./srcs/docker-compose.yml stop 

up:
	@printf "restarting configuration ${name}...\n"
	@docker compose -f ./srcs/docker-compose.yml up -d

down:
	@printf "Stopping configuration ${name}...\n"
	@docker compose -f ./srcs/docker-compose.yml down

re: fclean build

clean: down
	@printf "Cleaning configuration ${name}...\n"
	@docker system prune -a
	@sudo rm -rf /home/${USER}/data

fclean:
	@printf "Total clean of all configurations docker\n"
	@sudo rm -rf /home/${USER}/data
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@docker volume rm $$(docker volume ls -q)

rm-volume:
	@docker volume rm $$(docker volume ls -q)

.PHONY	: all build down re clean fclean


