# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lfrasson <lfrasson@student.42sp.org.b      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/29 22:01:06 by lfrasson          #+#    #+#              #
#    Updated: 2022/05/07 13:15:29 by lfrasson         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

IMAGE		:=	nginx
CONTAINER	:=	nginx

build:
	docker build -t $(IMAGE) .

run:
	docker run -d --rm -p 80:80 -p 443:443 --name $(CONTAINER) $(IMAGE)

exec:
	docker exec -it $(CONTAINER) /bin/bash

stop:
	docker stop $(CONTAINER)

.PHONY:	build run exec stop
