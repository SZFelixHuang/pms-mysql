#!/bin/bash
. /mysql/database-env.sh
. /mysql/character.sh
service mysql start
if [ -d "/var/lib/mysql/pms" ]; then
  . $SCRIPT_ROOT_PATH/jetspeed/initial_tables.sh
  . $SCRIPT_ROOT_PATH/pms/initial_tables.sh
else
  mysql < /mysql/schema.sql
  mysql < /mysql/privileges.sql
  . $SCRIPT_ROOT_PATH/jetspeed/initial_tables.sh
  . $SCRIPT_ROOT_PATH/jetspeed/initial_data.sh
  . $SCRIPT_ROOT_PATH/pms/initial_tables.sh
  . $SCRIPT_ROOT_PATH/pms/initial_data.sh
fi
tail -f /dev/null
