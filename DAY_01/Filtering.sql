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

