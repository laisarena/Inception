# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lfrasson <lfrasson@student.42sp.org.b      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/29 22:01:06 by lfrasson          #+#    #+#              #
#    Updated: 2022/05/07 15:40:02 by lfrasson         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COMPOSE_FILE= docker-compose.yml

build:
	cd srcs/ && docker-compose -f $(COMPOSE_FILE) up --build -d

down:
	cd srcs/ && docker-compose -f $(COMPOSE_FILE) down 

.PHONY:	build down

nginx-exec:
	make exec -C ./srcs/requirements/nginx
.PHONY: nginx-exec

mariadb-exec:
	make exec -C ./srcs/requirements/mariadb
.PHONY: mariadb-exec
