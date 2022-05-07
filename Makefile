# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lfrasson <lfrasson@student.42sp.org.b      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/29 22:01:06 by lfrasson          #+#    #+#              #
#    Updated: 2022/05/07 14:13:03 by lfrasson         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COMPOSE_FILE= docker-compose.yml

build:
	cd srcs/ && docker-compose -f $(COMPOSE_FILE) up --build -d

down:
	cd srcs/ && docker-compose -f $(COMPOSE_FILE) down 

nginx-exec:
	make exec -C ./srcs/requirements/nginx
.PHONY: nginx-exec

.PHONY:	build down
