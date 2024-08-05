use sakila;
select * from language;

select language_id, name, last_update from language;

select name from language;


# 가상 컬럼 만들기 (AS는 생략 가능)
select language_id,
	'COMMON' as language_usage,
	language_id * 3.14 as lang_pi_value,
	upper(name) as language_name
from language;


select * from film_actor;

select actor_id from film_actor order by actor_id;

# 중복 제거
select distinct actor_id from film_actor order by actor_id;


# 임시 테이블 생성
create temporary table actors_j
	(actor_id smallint(5),
	first_name varchar(45),
	last_name varchar(45));
desc actors_j;

insert into actors_j
	select actor_id, first_name, last_name
	from actor where last_name like 'J%';
select * from actors_j;


# 가상 테이블 생성
create view cust_vw as
	select customer_id, first_name, last_name, active
	from customer;
select * from cust_vw;


select first_name, last_name
from cust_vw where active = 0;


select * from customer;
select * from rental;

# INNER 조인 (두 개의 테이블에 둘다 존재하는 데이터를 묶어 하나의 집합을 만들어 냄)
select customer.first_name, customer.last_name,
	time(rental.rental_date) as rental_time
from customer inner join rental
	on customer.customer_id = rental.customer_id
where date(rental.rental_date) = '2005-06-14';


select date('2021-07-29 09:02:03');
select time('2021-07-29 09:02:03');


select title
from film
where rating = 'G' and rental_duration >= 7;


select title, rating, rental_duration
from film
where (rating = 'G' and rental_duration >= 7) or
	  (rating = 'PG-13' and rental_duration < 4);


select c.first_name, c.last_name, count(*) as rental_count
from customer as c
	inner join rental as r
	on c.customer_id = r.customer_id
group by c.first_name, c.last_name
having count(*) >= 40
order by count(*) desc;

select * from customer;
select * from rental;


select c.first_name, c.last_name,
	time(r.rental_date) as rental_time
from customer as c inner join rental as r
	on c.customer_id = r.customer_id
where date(r.rental_date) = '2005-06-14'
order by c.last_name, c.first_name asc;
# asc 오름차순은 생략 가능, 기본값이기 때문
# order by 뒤에 두 개의 요소가 있다면 앞쪽부터 정렬 후 중복이 있다면 뒷 쪽을 활용하여 정렬


select c.first_name, c.last_name,
	time(rental_date) as rental_time
from customer as c inner join rental as r
	on c.customer_id = r.customer_id
where date(r.rental_date) = '2005-06-14'
order by time(r.rental_date) desc;
# 내림차순


select c.first_name, c.last_name,
	time(rental_date) as rental_time
from customer as c inner join rental as r
	on c.customer_id = r.customer_id
where date(r.rental_date) = '2005-06-14'
order by 1 desc;


select actor_id, first_name, last_name
from actor
order by last_name, first_name;


select actor_id, first_name, last_name
from actor
where last_name = 'WILLIAMS' or last_name = 'DAVIS';


select c.store_id, c.email, r.rental_date, r.return_date
from customer as c inner join rental as r
	on c.customer_id = r.customer_id
where date(r.rental_date) = '2005-06-14'
order by return_date desc;


