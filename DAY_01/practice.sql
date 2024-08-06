show databases;
use sakila;

select now();

create database testdb;
use testdb;

drop table if exists person;
create table person
	(person_id smallint unsigned,
	fname varchar(20),
	lname varchar(20),
	eye_color enum('BR', 'BL', 'GR'),
	birth_date date,
	street varchar(30),
	city varchar(20),
	state varchar(20),
	country varchar(20),
	postal_code varchar(20),
	constraint pk_person primary key (person_id)
	);
	
desc person;

drop table if exists favorite_food;
create table favorite_food
	(person_id smallint unsigned,
	food varchar(20),
	constraint pk_favorite_food primary key (person_id, food),
	constraint fk_fav_food_person_id foreign key (person_id) references person(person_id)
	);
	
desc favorite_food;

set foreign_key_checks = 0;
alter table person modify person_id smallint unsigned auto_increment;
set foreign_key_checks = 1;

insert into person
	(person_id, fname, lname, eye_color, birth_Date)
	values (null, 'William', 'Turner', 'BR', '1972-05-27');

select * from person;

select person_id, fname, lname, birth_date from person;

select person_id, fname, lname, birth_date from 
person where lname = 'Turner';

insert into favorite_food (person_id, food) values (1, 'pizza');

