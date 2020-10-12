#!/bin/bash
chmod 600 id_rsa*
ssh-add id_rsa
if [ -d "./PMS-Database" ]; then
cd PMS-Database
git pull
cd ..
else
git clone felix-huang@vs-ssh.visualstudio.com:v3/felix-huang/PMS/PMS-Database
fi
docker rm -f $(docker ps -aq --filter "name=customizedmysql")
docker images -a | grep "pms" | awk '{print $3}' | xargs docker rmi
docker images|grep none|awk '{print $3 }'|xargs docker rmi
docker build -t mysql:pms .
mkdir ./data
data_folder=$(cd "$(dirname "$0")";pwd)/data
docker run --name customizedmysql -v $data_folder:/var/lib/mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 -d mysql:pms
