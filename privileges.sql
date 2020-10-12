use mysql;

create user pms identified by 'pms123456';

create user jetspeed identified by 'jetspeed123456';

grant all on pms.* to pms@'%' identified by 'pms123456' with grant option;

grant all on jetspeed.* to jetspeed@'%' identified by 'jetspeed123456' with grant option;

flush privileges;