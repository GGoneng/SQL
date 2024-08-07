select 1 as num, 'abc' as str
union
select 9 as num, 'xyz' as str;

use sakila;

select 'CUST' as type1, c.first_name, c.last_name
from customer c
union all
select 'ACTR' as type1, a.first_name, a.last_name
from actor a;


select count(first_name) from customer;
select count(first_name) from actor;


select 'ACTR1' as type, a.first_name, a.last_name
from actor as a
union all
select 'ACTR2' as type, a.first_name, a.last_name
from actor a;

select 'CUST' as type, c.first_name, c.last_name
from customer c
where c.first_name like 'J%' and c.last_name like 'D%'
union all 
select 'ACTR' as type, a.first_name, a.last_name
from actor a
where a.first_name like 'J%' and a.last_name like 'D%';


select c.first_name, c.last_name
from customer c
where c.first_name like 'J%' and c.last_name like 'D%'
union
select a.first_name, a.last_name
from actor a
where a.first_name like 'J%' and a.last_name like 'D%';


select c.first_name, c.last_name
from customer c
where c.first_name like 'D%' and c.last_name like 'T%';

select a.first_name, a.last_name
from actor a
where a.first_name like 'D%' and a.last_name like 'T%';

select c.first_name, c.last_name
from customer c
where c.first_name like 'D%' and c.last_name like 'T%'
intersect 
select a.first_name, a.last_name
from actor a
where a.first_name like 'D%' and a.last_name like 'T%';


select c.first_name, c.last_name
from customer c
where c.first_name like 'J%' and c.last_name like 'D%'
intersect 
select a.first_name, a.last_name
from actor a
where a.first_name like 'J%' and a.last_name like 'D%';


select c.first_name, c.last_name
from customer as c
inner join actor as a
on (c.first_Name = a.first_name) and (c.last_name = a.last_name);


select c.first_name, c.last_name
from customer as c
	inner join actor as a
	on (c.first_name = a.first_name) and (c.last_name = a.last_name)
where a.first_name like 'J%' and a.last_name like 'D%';


select a.first_name, a.last_name
from actor a
where a.first_name like 'J%' and a.last_name like 'D%'
except 
select c.first_name, c.last_name
from customer c
where c.first_name like 'J%' and c.last_name like 'D%';


select a.first_name, a.last_name
from actor a
where a.first_name like 'J%' and a.last_name like 'D%'
union all
select a.first_name, a.last_name
from actor a
where a.first_name like 'M%' and a.last_name like 'T%'
union 
select c.first_name, c.last_name
from customer c
where c.first_name like 'J%' and c.last_name like 'D%';


select first_name, last_name
from actor
where last_name like 'L%'
union 
select first_name, last_name
from customer
where last_name like 'L%';

select first_name, last_name
from actor
where last_name like 'L%'
union 
select first_name, last_name
from customer
where last_name like 'L%'
order by last_name;

