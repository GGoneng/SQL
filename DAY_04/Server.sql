use mysql;

select user, host from user;

create user 'minha'@'%' identified by '1234';
create user 'taeheon'@'%' identified by '1234';
create user 'hwansun'@'%' identified by '1234';
create user 'cube'@'%' identified by '1234';
create user 'kim'@'%' identified by '1234';

grant all privileges on *.* to 'taeheon'@'%';
grant all privileges on *.* to 'hwansun'@'%';
grant all privileges on *.* to 'cube'@'%';
grant all privileges on *.* to 'kim'@'%';

grant grant option on *.* to 'taeheon'@'%';
grant grant option on *.* to 'hwansun'@'%';
grant grant option on *.* to 'cube'@'%';
grant grant option on *.* to 'kim'@'%';

flush privileges;


select user, host from user;

