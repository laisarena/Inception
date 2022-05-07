# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lfrasson <lfrasson@student.42sp.org.b      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/29 22:01:06 by lfrasson          #+#    #+#              #
#    Updated: 2022/05/07 15:36:35 by lfrasson         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

IMAGE		:=	mariadb
CONTAINER	:=	mariadb

build:
	docker build -t $(IMAGE) .

run:
	docker run -d --rm --name $(CONTAINER) $(IMAGE)

exec:
	docker exec -it $(CONTAINER) /bin/bash

stop:
	docker stop $(CONTAINER)

.PHONY:	build run exec stop
