#!/bin/bash


#用来进入某个docker容器里面的脚本

echo "输入容器的name:"

read container_name

container_info=(`docker ps | grep $container_name`)

#获取容器id
container_id=`echo $container_info`

PID=`docker inspect --format "{{ .State.Pid }}" $container_id`

sudo nsenter --target $PID --mount --uts --ipc --net --pid
