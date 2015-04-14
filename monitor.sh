#!/bin/bash
#监听相关服务


#参数:
#service name
#command		
function monitor(){
	is_run=`/sbin/pidof $1`

	if [ "$is_run" = "" ];then
		echo "$1 not runing , we try start..."
		`echo $2`
		echo "$1 start"
	else
		echo "$1 is runing..."
	fi
}

monitor "nginx" "/etc/init.d/nginx start"
monitor "php-fpm" "/etc/init.d/php-fpm start"
monitor "mysqld" "/etc/init.d/mysqld start"
