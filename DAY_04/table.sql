create database scraping;

use scraping;

drop table if exists pages;

create table pages (
	id bigint(7) not null auto_increment,
	title varchar(200),
	content varchar(10000),
	created timestamp default current_timestamp,
	primary key(id)
);

describe pages;