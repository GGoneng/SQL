use sakila;

select c.email, r.rental_date
from customer as c
	inner join rental as r
	on c.customer_id = r.customer_id
where date(r.rental_date) != '2005-06-14';

select customer_id, rental_date
from rental
where rental_date < '2005-05-25';

# 시간 정보 때문에 6월 16일은 포함되지 않는다
select customer_id, rental_date
from rental
where rental_date <= '2005-06-16'
	and rental_date >= '2005-06-14'
	
select customer_id, rental_date
from rental
where date(rental_date) <= '2005-06-16' and
	  date(rental_date) >= '2005-06-14';
	  
	 
# BETWEEN 사용 시 무조건 작은 값 and 큰 값 으로 사용
select customer_id, rental_date
from rental
where date(rental_date) between '2005-06-16' and '2005-06-14';


select customer_id, rental_date
from rental
where date(rental_date) between '2005-06-14' and '2005-06-16';


select customer_id, payment_date, amount
from payment
where amount >= 10.0 and amount <= 11.99;


select last_name, first_name
from customer
where last_name between 'FA' and 'FRB';


select title, rating
from film
where rating = 'G' or rating = 'PG';

select title, rating
from film
where rating in ('G', 'PG');


select * from film;

# 괄호 내에서 뽑아온 부분이 rating('PG', 'G')를 뽑아오고 있으므로, 조건 또한 위와 같다.
select title, rating
from film
where rating in (select rating from film where title like '%PET%');


select title, rating from film where title like '%PET%';


select last_name, first_name
from customer
where last_name like '_A_T%S';

select last_name, first_name
from customer
where last_name like 'Q%' or last_name like 'Y%';


select rental_id, customer_id, return_date
from rental
where return_date is null;


select rental_id, customer_id, return_date
from rental
where return_date is not null;


select * from payment;


select payment_id, customer_id, amount, date(payment_date) as payment_date
from payment
where (payment_id between 101 and 120);


select payment_id, customer_id, amount, date(payment_date) payment_date
from payment
where (payment_id between 101 and 120)
and customer_id = 5 and not (amount > 6 or date(payment_date) = '2005-06-19');



