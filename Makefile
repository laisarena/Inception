# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lfrasson <lfrasson@student.42sp.org.b      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/29 22:01:06 by lfrasson          #+#    #+#              #
#    Updated: 2022/05/23 19:03:47 by lfrasson         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COMPOSE_FILE	:=	docker-compose.yml
VOLUMES_DIR		:=	/home/lfrasson/data
DATABASE_DIR	:=	$(VOLUMES_DIR)/mysql
WORDPRESS_DIR	:=	$(VOLUMES_DIR)/wordpress
DB_VOLUME		:=	dbdata
WP_VOLUME		:=	wpdata
TOOLS_DIR		:=	srcs/requirements/tools
HOSTS_BACKUP	:=	$(TOOLS_DIR)/hosts_backup
HOSTS_DEFAULT	:=	$(TOOLS_DIR)/hosts_default
MY_HOSTS		:=	$(TOOLS_DIR)/hosts
HOSTS			:=	/etc/hosts
DOMAIN_NAME		:=	$(shell grep DOMAIN_NAME srcs/.env | cut -d'=' -f2)
DOMAIN			:=	$(shell grep $(DOMAIN_NAME) /etc/hosts)
VOLUMES_LIST	:=	$(shell docker volume ls -q)

all: build

build: hosts volumes
	cd srcs/ && docker-compose -f $(COMPOSE_FILE) up --build -d

down:
	cd srcs/ && docker-compose -f $(COMPOSE_FILE) down 

clean:
ifneq ($(VOLUMES_LIST),)
	docker volume rm $(VOLUMES_LIST)
endif
	sudo rm -rf $(VOLUMES_DIR)

fclean: clean reset-hosts
	docker system prune -a --volumes

volumes: | $(DATABASE_DIR) $(WORDPRESS_DIR)

$(DATABASE_DIR):
	sudo mkdir -p $(DATABASE_DIR) 
	docker volume create \
		--name $(DB_VOLUME) \
		--opt type=none \
		--opt device=$(DATABASE_DIR) \
		--opt o=bind

$(WORDPRESS_DIR):
	sudo mkdir -p $(WORDPRESS_DIR) 
	docker volume create \
		--name $(WP_VOLUME) \
		--opt type=none \
		--opt device=$(WORDPRESS_DIR) \
		--opt o=bind

hosts:
ifeq ($(DOMAIN),)
	cp $(HOSTS) $(HOSTS_BACKUP)
	cp $(HOSTS_DEFAULT) $(MY_HOSTS) 
	sed -i "s/DOMAIN_NAME/$(DOMAIN_NAME)/g" $(MY_HOSTS)
	sudo cp $(MY_HOSTS) $(HOSTS) 
endif

reset-hosts:
	sudo cp $(HOSTS_BACKUP) $(HOSTS) 

.PHONY:	build down clean fclean all volumes hosts reset-hosts

nginx-exec:
	make exec -C ./srcs/requirements/nginx
.PHONY: nginx-exec

mariadb-exec:
	make exec -C ./srcs/requirements/mariadb
.PHONY: mariadb-exec

wordpress-exec:
	make exec -C ./srcs/requirements/wordpress
.PHONY: wordpress-exec
