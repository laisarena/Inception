#!/bin/sh

#WP_PATH=/var/www/lfrasson/wordpress
WP_CONFIG=wp-config.php

if [ ! -f "$WP_PATH/$WP_CONFIG" ]
then
	#cd $WP_PATH
	mv wp-config-sample.php $WP_CONFIG
	sed -i "s/username_here/$MYSQL_USER/g" $WP_CONFIG 
	sed -i "s/password_here/$MYSQL_PASSWORD/g" $WP_CONFIG 
	sed -i "s/localhost/$MYSQL_HOSTNAME/g" $WP_CONFIG 
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" $WP_CONFIG 
fi

exec "$@"
