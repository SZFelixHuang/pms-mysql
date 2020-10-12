FROM mysql:5.7

MAINTAINER Felix <felix_huang@outlook.com>

ENV MYSQL_ALLOW_EMPTY_PASSWORD yes

COPY database-env.sh /mysql/database-env.sh
COPY character.sh /mysql/character.sh
COPY setup.sh /mysql/setup.sh
COPY schema.sql /mysql/schema.sql
COPY privileges.sql /mysql/privileges.sql
COPY PMS-Database /mysql/PMS-Database
CMD ["sh", "/mysql/setup.sh"]
