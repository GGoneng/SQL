use sqlclass_db;

select * from nobel;

# (1)
select year, category, fullname
from nobel
where year = 1960 and (category = 'Peace' or category = 'Physics');

# (2)
select year, prize_amount, category, birth_continent, birth_country
from nobel
where fullname like '%Albert Einstein%';

# (3)
select year, fullname, birth_country
from nobel
where (year between 1910 and 2010) and (category = 'Peace')
order by year asc;

# (4)
select category, fullname
from nobel
where fullname like 'John%';

# (5)
select * from nobel
where year = 1964 and category != 'Physiology or Medicine'
order by fullname asc;

# (6)
select year, fullname, gender, birth_country
from nobel
where (year between 2000 and 2019) and category = 'Literature'

# (7)
select category, count(*) as count
from nobel
group by category
order by count(*) desc

# (8)
select distinct year from nobel
where category = 'Physiology or Medicine'

# (9)
select count(distinct year) as count from nobel
where year not in
(select distinct year from nobel
where category = 'Physiology or Medicine');

# (10)
select fullname, category, birth_country
from nobel
where gender = 'female';

# (11)
select birth_country, count(*) as count
from nobel
group by birth_country;

# (12)
select * from nobel
where birth_country = 'Korea';

# (13)
select * from nobel
where birth_country not in ('Europe', 'North America', '')

# (14)
select birth_country, count(*) as count from nobel
group by birth_country
having count(*) >= 10
order by count(*) desc;

# (15)
select fullname, count(*) as count
from nobel
group by fullname
having count(*) >= 2 and fullname != '';