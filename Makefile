# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lfrasson <lfrasson@student.42sp.org.b      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/29 22:01:06 by lfrasson          #+#    #+#              #
#    Updated: 2022/05/22 15:42:13 by lfrasson         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COMPOSE_FILE	:=	docker-compose.yml
VOLUMES_DIR		:=	/home/lfrasson/data
DATABASE_DIR	:=	$(VOLUMES_DIR)/mysql
WORDPRESS_DIR	:=	$(VOLUMES_DIR)/wordpress

build: volumes
	cd srcs/ && docker-compose -f $(COMPOSE_FILE) up --build -d

down:
	cd srcs/ && docker-compose -f $(COMPOSE_FILE) down 

clean:
	docker volume prune
	docker volume rm dbdata
	docker volume rm wordpress
	sudo rm -rf $(VOLUMES_DIR)

fclean:
	sudo rm -rf $(VOLUMES_DIR)
	docker system prune -a --volumes

volumes: | $(DATABASE_DIR) $(WORDPRESS_DIR)

$(DATABASE_DIR):
	sudo mkdir -p $(DATABASE_DIR) 
	docker volume create \
		--name dbdata \
		--opt type=nome \
		--opt device=$(DATABASE_DIR) \
		--opt o=bind

$(WORDPRESS_DIR):
	sudo mkdir -p $(WORDPRESS_DIR) 
	docker volume create \
		--name wordpress \
		--opt type=nome \
		--opt device=$(WORDPRESS_DIR) \
		--opt o=bind

.PHONY:	build down

nginx-exec:
	make exec -C ./srcs/requirements/nginx
.PHONY: nginx-exec

mariadb-exec:
	make exec -C ./srcs/requirements/mariadb
.PHONY: mariadb-exec

wordpress-exec:
	make exec -C ./srcs/requirements/wordpress
.PHONY: wordpress-exec
