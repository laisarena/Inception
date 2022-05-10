# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lfrasson <lfrasson@student.42sp.org.b      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/29 22:01:06 by lfrasson          #+#    #+#              #
#    Updated: 2022/05/08 19:21:13 by lfrasson         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COMPOSE_FILE	:=	docker-compose.yml
VOLUMES_DIR		:=	/home/lfrasson/data
DATABASE_DIR	:=	$(VOLUMES_DIR)/mysql

build: volumes
	cd srcs/ && docker-compose -f $(COMPOSE_FILE) up --build -d

down:
	cd srcs/ && docker-compose -f $(COMPOSE_FILE) down 

fclean:
	sudo rm -rf $(VOLUMES_DIR)

volumes: | $(DATABASE_DIR)

$(DATABASE_DIR):
	sudo mkdir -p $(DATABASE_DIR) 

.PHONY:	build down

nginx-exec:
	make exec -C ./srcs/requirements/nginx
.PHONY: nginx-exec

mariadb-exec:
	make exec -C ./srcs/requirements/mariadb
.PHONY: mariadb-exec
